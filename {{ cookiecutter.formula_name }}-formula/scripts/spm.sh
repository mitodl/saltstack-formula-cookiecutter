#!/bin/bash
if [ "$(ls /vagrant)" ]
then
    SRCDIR=/vagrant
else
    SRCDIR=/home/vagrant/sync
fi
#make the repository configurations
sudo mkdir -p /etc/salt/spm.repos.d
if [[ ! -z "$SPM_REMOTE_URL" ]] ; then
    echo "\
remote_repo:
  url: $SPM_REMOTE_URL" | sudo tee /etc/salt/spm.repos.d/spm_remote.repo
fi

#clean the build area
if [ -d /srv/spm_build ]; then
    sudo rm -rf /srv/spm_build
fi
#clean the installation cache
if [ -d /var/cache/salt/spm/ ]; then
sudo rm -rf /var/cache/salt/spm
fi
#clean the installed package area
if [ -d /srv/spm ]; then
sudo rm -rf /srv/spm
fi

#build the project
sudo spm build $SRCDIR
sudo spm update_repo
#use a local install to prevent https://github.com/saltstack/salt/issues/39266
#said issues will only occur when: 
# - more than one repo is configured, and
# - the same package name appears in both
latest=$(ls -t /srv/spm_build/{{ cookiecutter.formula_name }}*.spm | head -n1)
sudo spm local install -y -f $latest


if ls /srv/spm/pillar/*.orig > /dev/null 2>&1; then
#set up pillar top file
echo "\
base:
  '*':" | sudo tee /srv/pillar/top.sls

    for pillar in $(ls /srv/spm/pillar/*.orig); do
    newbase=$(basename $pillar)
    newbase=${newbase/.orig/}
    cp -f $pillar /srv/pillar/$newbase
    newbase=${newbase/.sls/}
    echo "    - $newbase" | sudo tee -a /srv/pillar/top.sls
    done
fi
