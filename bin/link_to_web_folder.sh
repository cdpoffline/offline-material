#!/bin/bash

# get the file name 
#   http://www.cyberciti.biz/faq/unix-linux-extract-filename-and-extension-in-bash/
offline_materials_web_folder_path="`realpath \"$1\"`"

if [ -z "$offline_materials_web_folder_path" ]
then
  >&2 echo "ERROR: The first argument must be the web folder."
  exit 1
fi

working_directory="`pwd`"
module_name="${working_directory##*/}"

for module_web_folder in _site web
do
  module_web_folder_path="$working_directory/$module_web_folder"
  module_web_folder_path_in_offline_materials="$offline_materials_web_folder_path/$module_name"
  link_to_offline_materials_web_folder="$module_web_folder_path/offline-materials"
  if [ -d "$module_web_folder_path" ]
  then
    rm -f "$module_web_folder_path_in_offline_materials"
    ln -s -T "$module_web_folder_path" "$module_web_folder_path_in_offline_materials"
    
    rm -f "$link_to_offline_materials_web_folder"
    ln -s -T "$offline_materials_web_folder_path" "$link_to_offline_materials_web_folder"
    break
  fi
done
