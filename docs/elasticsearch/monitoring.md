ElasticSearch Monitoring
=======================

Metricbeat
---------
```yaml
#-------------------------- Elasticsearch output ------------------------------
output.elasticsearch:
  # Array of hosts to connect to.
  hosts: ["https://elasticsearch-int-instace-node-1-monitoring:9200"]

  # Optional protocol and basic auth credentials.
  #ssl.certificate: "/etc/elasticsearch/certs/elastic-certificates.p12"
  ssl.verification_mode: "none"
  protocol: "https"
  username: "elastic"
  password: "9c5TD3gq4wgQgvBP"
```

```yaml
# Module: elasticsearch
# Docs: https://www.elastic.co/guide/en/beats/metricbeat/7.4/metricbeat-module-elasticsearch.html

- module: elasticsearch
  #metricsets:
  #  - node
  #  - node_stats
  period: 10s
  hosts: ["https://localhost:9200"]
  username: "elastic"
  password: "YfdcRTZBv4BmDBF8AMSV6syY"
  ssl.verification_mode: "none
```

Kibana
------
```yaml
elasticsearch.hosts: ["https://localhost:9200"]
elasticsearch.username: "elastic"
elasticsearch.password: "9c5TD3gq4wgQgvBP"
elasticsearch.ssl.verificationMode: "none"
```
