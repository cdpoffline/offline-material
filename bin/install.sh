#!/bin/bash

cd `dirname $0`

web_folder="../web"
mkdir -p "$web_folder"
web_folder="`realpath \"$web_folder\"`"
echo "- web folder: $web_folder"

sudo apt-get -y -q install git realpath

git submodule init
git submodule update

./modules_do.sh bin/install.sh
./modules_do.sh link_to_web_folder.sh "$web_folder"

