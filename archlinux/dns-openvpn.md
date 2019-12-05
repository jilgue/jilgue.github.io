DNS en ArchLinux cuando usas OpenVpn
------------------------------------

Es necesario tener Systemd-resolvconf o Openresolv instalado.

OpenVpn tiene en su github dos scripts para implementar la parte de "pull-resolv-conf custom scripts".

[https://github.com/OpenVPN/openvpn/tree/master/contrib/pull-resolv-conf](https://github.com/OpenVPN/openvpn/tree/master/contrib/pull-resolv-conf)

Hay que descargar ambos scripts y referenciarlos en la configuración de vpn:
```
up /etc/openvpn/client/client.up
down /etc/openvpn/client/client.down
```