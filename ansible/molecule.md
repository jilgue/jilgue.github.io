Molecule
========

Init role:
```bash
$ molecule init role -r new-role -d docker
$ molecule init scenario -r foo -d docker
```

Añadir disco a la VirtualBox:
```yaml
    provider_raw_config_args:
      - "customize ['createmedium', '--filename', '/tmp/large_disk.vdi', '--size', 1024]"
      - "customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', '/tmp/large_disk.vdi']"
```