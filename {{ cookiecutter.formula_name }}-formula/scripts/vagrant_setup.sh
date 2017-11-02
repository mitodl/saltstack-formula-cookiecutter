#!/bin/bash

if [ "$(ls /vagrant)" ]
then
    SRCDIR=/vagrant
else
    SRCDIR=/home/vagrant/sync
fi
sudo mkdir -p /srv/salt
sudo mkdir -p /srv/pillar
sudo mkdir -p /srv/formulas
{% if cookiecutter.deploy_salt_packages == "True" %}
sudo mkdir -p /var/cache/salt/master
{% else %}
sudo cp $SRCDIR/pillar.example /srv/pillar/pillar.sls
sudo cp -r $SRCDIR/{{ cookiecutter.formula_name }} /srv/salt
echo "\
base:
  '*':
    - pillar" | sudo tee /srv/pillar/top.sls
{% endif %}
sudo cp $SRCDIR/salt-top.example /srv/salt/top.sls
