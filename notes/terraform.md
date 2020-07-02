# Terraform

instances = [for key,value in var.elastic-cluster-by-zones : google_compute_instance.elasticsearch-instace-node[key].self_link ]

https://myshittycode.wordpress.com/2019/10/30/gcp-terraform-google-could-not-find-default-credentials-error/


quitar elemeto de una lista:
```
  permissions = [
  for permission in data.google_iam_role.compute_viewer.included_permissions:
  permission if permission != "resourcemanager.projects.list"
  ]
```
