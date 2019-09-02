# Kubernetes

Reuse PV: https://github.com/kubernetes/kubernetes/issues/48609#issuecomment-493178281

Remove claimRef from PV: `kubectl patch pv my-pv-name-123465789 -p '{"spec":{"claimRef": null}}'`
Create a PVC setting volumeName:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
...
spec:
  ...
  volumeName: my-pv-name-123465789
  ...
```
