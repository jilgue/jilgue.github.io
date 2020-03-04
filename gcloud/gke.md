Google Cloud - GKE
============

Set default region/zone

    gcloud config set compute/region us-central1

    gcloud config set compute/zone us-central1-a

Enable API's

    gcloud services enable container.googleapis.com

    gcloud services enable containerregistry.googleapis.com

Clone github for sample application and browse to directory

    git clone https://github.com/linuxacademy/content-gc-essentials

    cd content-gc-essentials/gke-lab-01

Package code into Docker container - tag as version 1 ("build it")

    docker build -t gcr.io/$DEVSHELL_PROJECT_ID/hello-la:v1 .

Note: the period at the end is required to build it at this location

Check status of images to ensure success

    docker images

Authenticate gcloud as a Docker credential helper

    gcloud auth configure-docker

Push Docker container into Container Registry

    docker push gcr.io/$DEVSHELL_PROJECT_ID/hello-la:v1

Create Kubernetes Engine Cluster (Nodes) named 'hello-cluster'

    gcloud container clusters create hello-cluster --num-nodes=2

Authenticate kubectl to point to the cluster we just made (already done for last created cluster)

    gcloud container clusters get-credentials hello-cluster

Deploy your app ("deploy and run it") - listen on port 80

    kubectl run hello-la --image=gcr.io/$DEVSHELL_PROJECT_ID/hello-la:v1 --port 80

Check out our pods on the nodes

    kubectl get pods

Create load balancer and expose application to the Internet on port 80

    kubectl expose deployment hello-la --type=LoadBalancer --port 80 --target-port 80

Find our load balancer frontend IP address

    kubectl get service

Scale up deployment - add static number of replicas (pods)

    kubectl scale deployment hello-la --replicas=3

On second thought, let's just autoscale our application instead....

Horizontal Pod Autoscaler

    kubectl autoscale deployment hello-la --max 6 --min 4 --cpu-percent 50

Maybe we should statically resize the node pool/cluster as well?

    gcloud container clusters resize hello-cluster --size 3

    If more than one pool per cluster, specify pool with --node-pool (pool_name)

On second thought (again), let's also enable autoscaling for our cluster

    gcloud container clusters update hello-cluster --enable-autoscaling --min-nodes 2 --max-nodes 8

Make changes to source code, then build as Docker file as VERSION 2

    docker build -t gcr.io/$DEVSHELL_PROJECT_ID/hello-la:v2 .

Push to Container Registry, also as version 2

    docker push gcr.io/$DEVSHELL_PROJECT_ID/hello-la:v2

Update our website - Apply rolling update to deployment with image update

    kubectl set image deployment/hello-la hello-la=gcr.io/$DEVSHELL_PROJECT_ID/hello-la:v2

Get log info

Logs are written to pods, by default also written to Stackdriver Logging

View log on pod

    kubectl logs (POD_ID)

Other commands/scenarios

Upgrade version of Kubernetes on cluster

    gcloud containers clusters upgrade (cluster_name)


kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0

Kubernetes 25% 4gb ram, 6% 1 cpu

   gcloud auth configure-docker
