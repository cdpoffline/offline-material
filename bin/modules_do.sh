#!/bin/bash


if ! type realpath 1>>/dev/null 2>>/dev/null
then
  >&2 echo "'realpath' is not installed. You can install it by typing 'sudo apt-get install realpath'."
  exit 1
fi

location="`dirname \"$0\"`"
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
