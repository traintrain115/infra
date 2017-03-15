#!/bin/bash

sed -i s#Defaults.*requiretty#Defaults\ \!requiretty#g /etc/sudoers
cd /tmp/
echo "Downloading the debian package"
wget  http://35.163.215.138/chef_12.19.36-1_amd64.deb
echo "Installating the rpm"

sudo dpkg -i *.deb

sudo mkdir -p /etc/chef

cd /etc/chef

sudo wget http://35.163.215.138/client.rb
sudo wget http://35.163.215.138/knife.rb
sudo wget http://35.163.215.138/34swetha.pem
chmod 400 34swetha.pem
sudo chef-client
