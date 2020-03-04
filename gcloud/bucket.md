Google Cloud - Bucket
============

From the Cloud Shell, create the necessary bucket:

`gsutil mb -c regional -l us-east1 gs://<BUCKET NAME>`

In order to make the objects publicly viewable, we need to add a couple roles:

`gsutil iam ch allUsers:objectViewer gs://<BUCKET NAME>`

Ver ciclo de vida:

`gsutil lifecycle get gs://la-lifecycle-47`

`gsutil lifecycle set delete-after-two-years.json gs://la-lifecycle-47`
```json
{
  "rule": [
    {
      "action": {
        "storageClass": "NEARLINE",
        "type": "SetStorageClass"
      },
      "condition": {
        "age": 180,
        "matchesStorageClass": [
          "REGIONAL",
          "STANDARD"
        ]
      }
    }
  ]
}
```

`gsutils ls gs://`
`gsutils cp file gs://`
