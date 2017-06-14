#!/bin/bash
sudo apt-get update;
sudo apt-get install -y ansible git curl python-simplejson rake sshpass;
ansible --version;
sudo pip install --upgrade ansible
sudo pip install --upgrade docker-compose
#sudo gem install net-ssh --version "=2.9.2"
#sudo gem install ansible_spec

