TestInfra
========

Variables de Ansible:
```python
def test_vars(host):
    all_variables = host.ansible.get_variables()
    result = host.ansible("debug", "var=vars")
    print(all_variables)
    print(result)
    assert False
```

Sacar una variable específica:
```yaml
provisioner:
  name: ansible
  inventory:
    group_vars:
      all:
        physical_device: /dev/sdb
        logical_volume_size: 100%FREE
        logical_volume_resizefs: true
        logical_volume_shrink: false
        filesystem_type: xfs
        mount_path_mode: 0755
        volume_group: volume
        logical_volume_name: logical
        mount_path: /path/mount
```

```python
def test_vars(host):
    result = host.ansible("debug", "var=mount_path")
    print(result['mount_path'])
    assert False

```
