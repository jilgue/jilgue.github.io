Cluster de ElasticSearch en Google Compute Engine
=================================================

Crear máquinas en GCloud con Terraform
--------------------------------------
Hacen falta los siguientes recursos:
```hcl-terraform
resource "google_compute_disk" "elasticsearch-data-disk-node" {}

resource "google_compute_instance" "elasticsearch-instace-node" {}
```

### Uso de for_each en recursos
Desde la versión 0.12.12 se pueden crear recursos usando el for_each: [https://www.terraform.io/docs/configuration/resources.html#for_each-multiple-resource-instances-defined-by-a-map-or-set-of-strings](https://www.terraform.io/docs/configuration/resources.html#for_each-multiple-resource-instances-defined-by-a-map-or-set-of-strings)

De manera que podemos tener definida la siguiente variable:
```hcl-terraform
variable "elastic-cluster-by-zones" {
  type = map(map(string))
}

elastic-cluster-by-zones = {
  1 = {
	zone: "europe-west1-b"
	type: "all"
  }
  2 = {
	zone: "europe-west1-c"
	type: "all"
  }
  3 = {
	zone: "europe-west1-d"
	type: "all"
  }
  4 = {
	zone: "europe-west1-d"
	type: "data"
  }
}
```

Y usarla de la siguiente manera:
```hcl-terraform
resource "google_compute_instance" "elasticsearch-instace-node" {
  for_each = var.elastic-cluster-by-zones
  zone =  each.value.zone
  name = "elasticsearch-${var.environment}-instace-node-${each.key}"

  attached_disk {
	source = google_compute_disk.elasticsearch-data-disk-node[each.key].self_link
  }

   labels = {
	service = "elasticsearch"
	type = each.value.type
  }
}
```

Instalar ElasticSearch con Ansible
----------------------------------

La instalación se hace usando el rol `elastic.elasticsearch` que viene muy completo.

Para ello hay que instalarlo del galaxy: `ansible-galaxy install --roles-path=roles elastic.elasticsearch,7.4.1`

### Inventario dinámico contra GCloud

Ansible provee de un plugin para crear un inventario dinámico de las máquina que se han creado el Google Cloud.

Para ello hay que tener el fichero `ansible.cfg` en la carpeta con nuestro playbook:
```ini
[inventory]
enable_plugins = gcp_compute
```

Y tener las siguientes dependencias de python instaladas: `pip install ansible==2.8.5 requests google-auth jmespath`

El fichero de inventario tendrá una pinta como esta:
```yaml
---
plugin: gcp_compute
projects:
  - # Nombre del proyecto
regions:
  - # Región
keyed_groups: # Grupos de ansible que se van a crear según la label
  - prefix: type
	key: labels.type
hostnames:
  - public_ip
filters: # Filtro de máquinas que queremos utilizar
  - labels.service = "elasticsearch"
auth_kind: serviceaccount
service_account_file: # Fichero de autenticación
```

Auto descubrimiento de nodos en GCE y escalado
----------------------------------------------
Elastic tiene un plugin de forma que puede descubrir los nodos del cluster dentro de la red de Google.

Para activarlo hay que tener configurado las siguientes variables en el rol:
```yaml
es_plugins:
  - plugin: discovery-gce

es_config:
  discovery:
	zen:
	  minimum_master_nodes: 1
	  hosts_provider: gce
  cloud:
	gce:
	  project_id: "{{ project }}"
	  zone: ["europe-west1-b", "europe-west1-c", "europe-west1-d"]
```

Y es necesario crear las máquinas con el service account `compute-rw`, para ello en la parte de Terraform añadimos:
```hcl-terraform
  service_account {
	scopes = ["compute-rw"]
  }
```

Más información en [https://www.elastic.co/guide/en/elasticsearch/plugins/current/discovery-gce-usage-long.html#discovery-gce-usage-long-first-instance](https://www.elastic.co/guide/en/elasticsearch/plugins/current/discovery-gce-usage-long.html#discovery-gce-usage-long-first-instance)

Habilitar autenticación mediante API KEY
----------------------------------------
Para poder habilitar la autenticación mediante API KEY en Elastic es necesario tener activo el plugin `security`:
```yaml
es_enable_xpack: true
es_xpack_features: ["security"]
```

Es un paquete gratuito de xpack.

Una vez habilitado es obligatorio tener configuradas las siguientes variables:
```yaml
es_api_basic_auth_username:
es_api_basic_auth_password:
```

Con esto tenemos autenticación básica con usuario y contraseña pero si queremos crear api keys tenemos que habilitar el cifrado dentro de Elastic: [https://www.elastic.co/guide/en/elasticsearch/reference/current/configuring-tls.html](https://www.elastic.co/guide/en/elasticsearch/reference/current/configuring-tls.html)

### Cifrado de Elastic

Primero tenemos que crear los certificados. Elastic nos provee de dos comandos para ayudarnos:
```
bin/elasticsearch-certutil ca
bin/elasticsearch-certutil cert --ca elastic-stack-ca.p12
```

Luego tenemos que copiar el certificado a cada una de las máquinas y configurar `xpack.security.transport.ssl` y `xpack.security.http.ssl`:
```yaml
xpack.security.transport.ssl.enabled: true
xpack.security.transport.ssl.verification_mode: certificate
xpack.security.transport.ssl.keystore.path: /etc/elasticsearch/certs/elastic-certificates.p12
xpack.security.transport.ssl.truststore.path: /etc/elasticsearch/certs/elastic-certificates.p12
xpack.security.http.ssl.enabled: true
xpack.security.http.ssl.keystore.path: /etc/elasticsearch/certs/elastic-certificates.p12
xpack.security.http.ssl.truststore.path: /etc/elasticsearch/certs/elastic-certificates.p12
```

Por último habilitamos la autenticación por api key y reiniciamos:
```yaml
xpack.security.authc.api_key.enabled: true
```
