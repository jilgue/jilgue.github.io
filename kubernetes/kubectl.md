# Kubectl reference


`kubectl delete pod --field-selector="status.phase==Failed"`

`kubectl run mysql-client --image=mysql:5.7 -it --rm --restart=Never -- /bin/bash`

force object resource: `kubectl patch crd/crontabs.stable.example.com -p '{"metadata":{"finalizers":[]}}' --type=merge`
