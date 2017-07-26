#!/bin/bash

sed -i s#Defaults.*requiretty#Defaults\ \!requiretty#g /etc/sudoers
cd /tmp/
echo "Downloading the rpm"
wget  http://10.0.0.119/chef-12.19.36-1.el7.x86_64.rpm

echo "Installating the rpm"

sudo rpm -ivh *.rpm

sudo mkdir -p /etc/chef

cd /etc/chef

wget http://10.0.0.119//client.rb
#wget http://10.0.0.119/knife.rb
wget http://10.0.0.119/sandykarhty20.pem
chmod 400 sandykarhty.pem
sudo chef-client
