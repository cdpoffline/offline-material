#!/bin/bash

# get the file name 
#   http://www.cyberciti.biz/faq/unix-linux-extract-filename-and-extension-in-bash/
web_folder="$1"

if [ -z "$web_folder" ]
then
  >&2 echo "ERROR: The first argument must be the web folder."
  exit 1
fi

folder="`pwd`"
web_folder_name="${folder##*/}"

for possible_web_folder_name in _site web
do
  full_path="$folder/$possible_web_folder_name"
  web_path="$web_folder/$web_folder_name"
  if [ -d "$full_path" ]
  then
    rm -f $web_path && ln -s "$full_path" "$web_path" 
    break
  fi
done
