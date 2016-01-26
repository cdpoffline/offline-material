#!/bin/bash

directory=/opt/offline-material

sudo apt-get -y install git
cd /opt
sudo mkdir $directory
sudo chown -R `whoami` $directory
cd $directory

git clone git@github.com:cdpoffline/offline-material.git . || git clone https://github.com/cdpoffline/offline-material.git .

cd bin

./install.sh