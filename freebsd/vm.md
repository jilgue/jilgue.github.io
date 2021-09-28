# Document Title

```sh
cd /usr/ports/sysutils/vm-bhyve/
make install clean
vim
pkg search vim
pkg install vim-console-8.2.2725
sysrc vm_enable="YES"
mkdir -p /srv/vm
sysrc vm_dir="/srv/vm"
vm init
vm list
cp /usr/local/share/examples/vm-bhyve/* /src/vm/.templates/
vm switch create public
vm switch add public bridge0
vm switch add public em0
df -h
vm create -t debian -s 10G debian
mkdir -p /src/vm/.templates/
wget https://raw.githubusercontent.com/churchers/vm-bhyve/master/sample-templates/debian.conf -o /src/vm/.templates/debian.conf
curl -o /src/vm/.templates/debian.conf https://raw.githubusercontent.com/churchers/vm-bhyve/master/sample-templates/debian.conf
cat /src/vm/.templates/debian.conf
vm create -t debian -s 10G debian
vm iso https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.6.0-amd64-netinst.iso
vm iso https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.9.0-amd64-netinst.iso
vm install debian debian-10.9.0-amd64-netinst.iso
cd ..
cd /usr/ports/sysutils/grub2-bhyve/
make install clean
history
vm switch create -i bridge0 -p -a 192.168.22.143/24 bridge
```
