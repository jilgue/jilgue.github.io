Google Cloud - Network
============

crear vpc: `gcloud compute networks create la-network --subnet-mode custom`

crear subredes:
```
gcloud compute networks subnets create la-subnet-us-central --network la-network --region us-central1 --range 10.0.1.0/24
gcloud compute networks subnets create la-subnet-eu-west --network la-network --region europe-west1 --range 10.0.2.0/24
```

list: `gcloud compute networks subnets list --network la-network`

firewall: `gcloud compute firewall-rules create la-allow-ssh --allow tcp:22,icmp --network la-network`
