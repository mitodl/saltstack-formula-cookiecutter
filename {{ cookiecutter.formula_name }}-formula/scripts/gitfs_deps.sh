#!/bin/bash

if [ $(which apt-get) ];
then
    sudo apt-get update
    PKG_MANAGER="apt-get"
    PKGS="python3-dev git curl"
else
    PKG_MANAGER="yum"
    PKGS="python3-devel git curl"
fi

sudo $PKG_MANAGER -y install $PKGS

if [ $(which pip) ];
then
    echo ''
else
    curl -L "https://bootstrap.pypa.io/get-pip.py" > get_pip.py
    sudo python3 get_pip.py
    rm get_pip.py
fi

sudo pip3 install gitpython testinfra
