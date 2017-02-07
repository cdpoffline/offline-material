#!/bin/bash

directory="offline-material"

sudo apt-get -y -q install git

mkdir -p "$directory"
cd $directory

echo "yes" | git clone https://github.com/cdpoffline/offline-material.git .

cd bin

./install.sh
