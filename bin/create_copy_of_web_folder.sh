#!/bin/bash

if [ -n "$1" ]
then
  destination="$1"
else
  destination="`dirname \"$0\"`/../web_copy"
fi

destination="`realpath \"$destination\"`"
source="`dirname \"$0\"`"
source="`realpath \"$source\"/../web`"
echo "Copying files from \"$source\" to \"$destination\"."

IFS=$'\n'

cd "$source"

mkdir -p "$destination"

for file in `find -L -regextype posix-extended -regex '\.(/[^/.][^/]*)*' 2>>/dev/null`
do
  echo "$file"
  if [ -d "$file" ]
  then
    mkdir -p "$destination/$file"
  else
    # asuming file
    cp -T "$file" "$destination/$file"
  fi
done 

