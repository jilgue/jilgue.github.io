Google Cloud - IAM
============

```
gcloud projects get-iam-policy (PROJECT_ID) > filename.yaml
gcloud projects set-iam-policy PROJECT_ID filename.yaml
gcloud projects add-iam-policy-binding PROJECT_ID --member user:{{user's email}} --role roles/editor
```

### Add member to organization

Role / Resource Manager / Organization viewer
Role / Resource Manager / Project creator
Role / Billing / Billing account user

### Lista de roles

https://cloud.google.com/iam/docs/understanding-roles#predefined_roles

Añadir permisos a un service account gcloud projects add-iam-policy-binding patinando-developerenvironment --member serviceAccount:terraform-infraestuture@patinando-developerenvironment.iam.gserviceaccount.com --role roles/editor

gcloud projects get-iam-policy patinando-run-test

### Billing

#### Billing Roles

* Billing Account Creator: create new billing accounts
  * Organization level only

* Billing Account Administrator: manage (but not create) accounts
  * Configure billing export
  * Link / unlink projects
  * Manage billing user roles

* Billing Account User: link project with billing account
  * Often paired with Project Creator

* Billing Account Viewer view billing information

* Project Billing Manager: link / unlink account to projects
  * Similar to Billing Account User, but with no access to projects resources
  * Organization or project level

#### Billing exports

Find all charges that were more than 3 dollars:
```
  SELECT product, resource_type, start_time, end_time,  
  cost, project_id, project_name, project_labels_key, currency, currency_conversion_rate,
  usage_amount, usage_unit
  FROM `cloud-training-prod-bucket.arch_infra.billing_data`
  WHERE (cost > 3)
```

Find which product had the highest total number of records:
```
  SELECT product, COUNT(*)
  FROM `cloud-training-prod-bucket.arch_infra.billing_data`
  GROUP BY product
  LIMIT 200
```

Which product most frequently cost more than a dollar:
```
  SELECT product, cost, COUNT(*)
  FROM `cloud-training-prod-bucket.arch_infra.billing_data`
  WHERE (cost > 1)
  GROUP BY cost, product
  LIMIT 200
```
