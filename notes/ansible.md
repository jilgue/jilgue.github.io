# Ansible
```
$ pip2 install git+https://github.com/ansible/ansible.git@stable-2.3
```
## Molecule
```
$ virtualenv -p/usr/bin/python2 --no-site-packages .venv
$ source .venv/bin/activate
$ pip install molecule ansible docker-py
$ molecule init role -r new-role -d docker
$ molecule init scenario -r foo -d docker
$ molecule test
```
