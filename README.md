# deploy-tools
Deployment ansible scripts

# Playbooks
* initialize.yml: install minimal configuration for ansible.
* mysql.yml: install mysql and create databases and right
* httpd.yml: install servers, get sources, install / upgrade application

# Passwords
Application passwords are stored on the file playbooks/vars/password.yml. This file is encrypted. To edit it use this command:
```
$ ansible-vault edit playbooks/vars/password.txt
```

For the ssh connection no password are required, you need to configure manually the ssh access with ssh-copy-id.

# Usage

One inventory is declared per domain/application. To execute a playbook for all applications, use this command:
```
$ echo 'Vault password' > /tmp/vault.txt
$ for f in inventory/*.* ; do ansible-playbook -i $f playbooks/httpd.yml --vault-pass=/tmp/vault.txt; done
```
