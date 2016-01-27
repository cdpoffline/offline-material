#!/bin/bash

location="`dirname $0`"
location="`realpath \"$location\"`"

modules="$location/../modules"
cd "$modules"

export PATH="$location:$PATH"

# echo to stderr
#   http://stackoverflow.com/questions/2990414/echo-that-outputs-to-stderr
>&2 echo "location=$location"

for module_directory in `ls`
do
  >&2 echo "--- Working on $module_directory "
  directory="$modules/$module_directory"
  >&2 echo "- in `realpath \"$directory\"`"
  >&2 echo "- command: $@"
  cd $directory
  "$@"
done
