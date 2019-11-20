# Terraform

instances = [for key,value in var.elastic-cluster-by-zones : google_compute_instance.elasticsearch-instace-node[key].self_link ]
