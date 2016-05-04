#!/bin/bash

set -e

sudo apt-get -y -q install git realpath

cd "`dirname \"$0\"`"

web_folder="../web"
mkdir -p "$web_folder"
web_folder="`realpath \"$web_folder\"`"
echo "- web folder: $web_folder"

cd ..

git submodule init
git submodule update

./modules_do.sh git checkout master

touch installed
