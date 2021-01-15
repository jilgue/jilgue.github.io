# Kubernetes Utils

- https://github.com/ahmetb/kubectx

```sh
sudo pacman -S kubectx
```

- https://github.com/jonmosco/kube-ps1

```sh
pikaur -S kube-ps1 --noconfirm
alias k8sprompt='. $HOME/.bashk8s'
source '/opt/kube-ps1/kube-ps1.sh'
PS1='[\u@\h \W $(kube_ps1)]$ '
```

- https://github.com/derailed/k9s -> https://k9scli.io/
