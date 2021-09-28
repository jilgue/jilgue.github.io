# Nextcloud on OPNsense

Install https://github.com/churchers/vm-bhyve#install

Create new zfs partition

```sh
root@OPNsense:~ # geom disk list
Geom name: ada0
Providers:
1. Name: ada0
   Mediasize: 32017047552 (30G)
   Sectorsize: 512
   Mode: r1w1e3
   descr: Hoodisk SSD
   lunid: 0000000000000000
   ident: LBMLCCC12190198
   rotationrate: 0
   fwsectors: 63
   fwheads: 16

Geom name: ada1
Providers:
1. Name: ada1
   Mediasize: 1000204886016 (932G)
   Sectorsize: 512
   Stripesize: 4096
   Stripeoffset: 0
   Mode: r0w0e0
   descr: CT1000MX500SSD1
   lunid: 500a0751e4fbd986
   ident: 2108E4FBD986
   rotationrate: 0
   fwsectors: 63
   fwheads: 16

root@OPNsense:~ # gpart create -s gpt ada1
ada1 created
root@OPNsense:~ # gpart add -t freebsd-ufs ada1
ada1p1 added
root@OPNsense:~ # newfs -U -t /dev/ada1p1
```

```sh
root@OPNsense:/ # cat /etc/fstab
# Device		Mountpoint	FStype	Options		Dump	Pass#
/dev/gpt/rootfs	/		ufs	rw,noatime	1	1
/dev/ada1p1	/srv		ufs	rw		2	2
```

```sh
mkdir -p /srv/vm/.templates/
curl -o /srv/vm/.templates/debian.conf https://raw.githubusercontent.com/churchers/vm-bhyve/master/sample-templates/debian.conf
```

sysrc vm_dir="/srv/vm"
vm init
vm switch create -p -a 192.168.23.0/24 bridge
vm create -t debian -s 800G debian
vm iso https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.9.0-amd64-netinst.iso
vm install debian debian-10.9.0-amd64-netinst.iso
vm console debian
