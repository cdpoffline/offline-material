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

cd bin
./modules_do.sh git checkout master

./modules_do.sh bash -c "git remote add ssh_github \"\`git config --get remote.origin.url | sed -r 's/https?:\/\/github\.com\/([^\/]+)\/([^\/]+)\.git/git@github.com:\1\/\2.git/g'\`\""

git remote add ssh_github git@github.com:cdpoffline/offline-material.git

touch installed
