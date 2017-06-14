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

# Create a new website/application

Each inventory is dedicated to one application. So to make new demo website, create a new inventory inspired from inventory/advancedimporter.prestashop.demo.madef.fr for example.

At the end of the file, there are variables that define how the application is deployed. The variables that must be changed for a PrestaShop demo website are:
* name: name of your application (no space, no special chars)
* domain: full domain of your website
* modules: list of module you want imported for github
* mysql_database: name of the database
* mysql_user: user for the mysql

