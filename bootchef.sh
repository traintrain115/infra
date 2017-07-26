#!/bin/bash

sudo sed -i s#Defaults.*requiretty#Defaults\ \!requiretty#g /etc/sudoers
cd /tmp/
echo "Downloading the rpm"
sudo curl -o chef-12.19.36-1.el7.x86_64.rpm   http://10.0.0.119/chef-12.19.36-1.el7.x86_64.rpm

echo "Installating the rpm"

sudo rpm -ivh *.rpm

sudo mkdir -p /etc/chef
sudo chmod -R 777 /etc/chef
cd /etc/chef

sudo curl -o /etc/chef/client.rb  http://10.0.0.119//client.rb
#wget http://10.0.0.119/knife.rb
sudo curl -o /etc/chef/sandykarhty20.pem  http://10.0.0.119/sandykarhty20.pem
sudo chmod 400 /etc/chef/sandykarhty20.pem
sudo chef-client
