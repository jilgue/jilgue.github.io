Molecule
========

## Init role
```bash
$ molecule init role -r new-role -d docker
$ molecule init scenario -r foo -d docker
```

## Añadir disco a la VirtualBox
* Ubuntu:
```yaml
    provider_raw_config_args:
      - "customize ['createmedium', '--filename', '/tmp/ubuntu_disk.vdi', '--size', 64]"
      - "customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', '/tmp/ubuntu_disk.vdi']"
```

* Centos:
```yaml
    provider_raw_config_args:
      - "customize ['createmedium', '--filename', '/tmp/centos_disk.vdi', '--size', 64]"
      - "customize ['storageattach', :id, '--storagectl', 'IDE', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', '/tmp/centos_disk.vdi']"
```
