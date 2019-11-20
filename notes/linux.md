# Linux

Cambiar de grupo sin reiniciar: `newgrp`

Rename en ArchLinux:
* `$ perl-rename -n 's/^3./4./g' *`
* `$ perl-rename 's/ /_/g' file.txt`

Sed:
```bash
$ sed -i ':a;N;$!ba;s/namespace: default\n//g' */*
$ sed -i 's/namespace: default//g' */*
```

## IP command

```bash
# ip addr add 192.168.50.5/24 dev eth1
# ip addr del 192.168.50.5/24 dev eth1
# ip link set eth1 up
# ip link set eth1 down
# ip route add 10.10.20.0/24 via 192.168.50.100 dev eth0
# ip route del 10.10.20.0/24
# ip route add default via 192.168.50.100
```
