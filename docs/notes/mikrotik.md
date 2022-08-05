MikroTik
========

RouteOS
-------

### Conexión ssh:
```bash
$ ssh -oHostKeyAlgorithms=+ssh-dss -oCiphers=+aes192-cbc  -oKexAlgorithms=diffie-hellman-group14-sha1 admin@192.168.88.1
```

### Nueva wlan:

* new wireless security profile: http://192.168.88.1/webfig/#Wireless.Security_Profiles
** MAC auth
```bash
> interface wireless security-profiles print
```

* new wireless interface: http://192.168.88.1/webfig/#Wireless.WiFi_Interfaces
** virual AP

* new bridge http://192.168.88.1/webfig/#Bridge.Ports

* http://192.168.88.1/webfig/#Wireless.Access_List

### Backup:
```bash
> system backup save
```


### Otros

> /ip service print
> /ip service enable 2

[admin@MikroTik] /interface vlan> add name=vlan-2 vlan-id=2 interface=ether2 disabled=no
[admin@MikroTik] /interface> bridge add name=br-vlan-2 disabled=no 
[admin@MikroTik] /interface> bridge port add bridge=br-vlan-2 interface=vlan-2
[admin@MikroTik] /interface> bridge port add bridge=br-vlan-2 interface=wlan1 
failure: device already added as bridge port
