# Kubernetes

## Kubectl reference

`kubectl delete pod --field-selector="status.phase==Failed"`

`kubectl run mysql-client --image=mysql:5.7 -it --rm --restart=Never -- /bin/bash`

force object resource: `kubectl patch crd/crontabs.stable.example.com -p '{"metadata":{"finalizers":[]}}' --type=merge`

## PV

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

Release to Available PV:
```bash
$ kubectl patch pv iscsi-pv -p '{"spec":{"claimRef": null}}'
```

## Networking

* https://medium.com/microsoftazure/understanding-kubernetes-networking-part-1-d3e5a031da74
* https://medium.com/microsoftazure/understanding-kubernetes-networking-part-2-4b7aa58919bb
* https://medium.com/microsoftazure/understanding-kubernetes-networking-part-3-68bfbc9d4ae
* https://medium.com/microsoftazure/understanding-kubernetes-networking-part-4-83cf657006bb

## User Authentication and Authorization

- [https://medium.com/globant/vanilla-kubernetes-user-authentication-and-authorization-in-depth-b26ec2626734](https://medium.com/globant/vanilla-kubernetes-user-authentication-and-authorization-in-depth-b26ec2626734)
- [https://github.com/JorgeReus/k8s-user-auth](https://github.com/JorgeReus/k8s-user-auth)
