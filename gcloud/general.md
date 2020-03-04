Google Cloud - General
============

$ gcloud init
$ gcloud auth login
$ gcloud config set account ACCOUNT
$ gcloud config set project PROJECT_ID

exportar json https://console.cloud.google.com/apis/credentials/serviceaccountkey
export GOOGLE_CLOUD_KEYFILE_JSON={{path}}

ln -s id_rsa google_compute_engine
ln -s id_rsa.pub google_compute_engine.pub

$ gcloud compute ssh elasticsearch-int-instace-node-1
Updating project ssh metadata...⠹Updated [https://www.googleapis.com/compute/v1/projects/prensa-content-api-int].
Updating project ssh metadata...done.                                               
Waiting for SSH key to propagate.
Warning: Permanently added 'compute.8456864361159166872' (ECDSA) to the list of known hosts.
Last login: Wed Jan 29 10:16:58 2020 from myfw01.edicioneselpais.net

