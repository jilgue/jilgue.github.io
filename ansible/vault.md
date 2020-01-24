Ansible Vault
=============

```bash
$ ansible-vault encrypt_string --vault-password-file a_password_file 'foobar' --name 'the_secret'
$ ansible-playbook -i inventory.ini --vault-password-file .vault-password-file provision.yml
```

