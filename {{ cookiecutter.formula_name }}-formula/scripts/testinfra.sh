#!/bin/bash

sudo pip install testinfra
sudo rm -rf /vagrant/tests/__pycache__
testinfra /vagrant/tests
