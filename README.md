# deploy-tools
Deployment ansible scripts

# Installation

Don't forget do get submodules
```
git submodule update --init --recursive
```

# Playbooks
* initialize.yml: install minimal configuration for ansible.
* mysql.yml: install mysql and create databases and right
* httpd.yml: install servers, get sources, install / upgrade application

# Passwords
Application passwords are stored on the file playbooks/vars/password.yml. This file is encrypted. To edit it use this command:
```
$ ansible-vault edit playbooks/vars/passwords.yml
```

For the ssh connection no password are required, you need to configure manually the ssh access with ssh-copy-id.

# Usage

One inventory is declared per domain/application. To execute a playbook for all applications, use this command:
```
$ echo 'Vault password' > vault.txt
$ for f in inventory/*.* ; do ansible-playbook -i $f playbooks/httpd.yml --vault-password-file=vault.txt; done
```

Deploy prestashop demo store
```
find inventory -name '*prestashop.demo.madef.fr' -type f -exec ansible-playbook -i {} playbooks/httpd.yml --vault-password-file=vault.txt \;
```

# Create a new website/application

## Inventory
Each inventory is dedicated to one application. So to make new demo website, create a new inventory inspired from inventory/advancedimporter.prestashop.demo.madef.fr for example.

At the end of the file, there are variables that define how the application is deployed. The variables that must be changed for a PrestaShop demo website are:
* name: name of your application (no space, no special chars)
* domain: full domain of your website
* modules: list of module you want imported for github
* version: version of PrestaShop
* mysql_database: name of the database
* mysql_user: user for the mysql

If it's not a demo prestashop these variables could help you:
* application
* create_root_dir: create the root dir of apache sites
* is_demo: for prestashop site, if true the site is full re-installed.

## Passwords

If you create a new application, don't forget to define the passwords :
```
$ ansible-vault edit playbooks/vars/password.txt
```
