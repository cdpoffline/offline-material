#!/bin/bash

# definitions

function activate() {
  if ! [ -f "$active_link" ]
  then
    if ! [ -f "$inactive_link" ]
    then
      (
        echo "- Installing \"$module_name\" in \"`pwd`\""
        cd "$module_name"
        bin/install.sh
        ../../bin/link_to_web_folder.sh ../../web
        ln -s -T "$active_modules" "`realpath .`"
        echo "- Module \"$module_name\" installed and activated."
      )
    else
      mv "$inactive_link" "$active_link"
      >&2 echo "- Module \"$module_name\" activated."
    fi
    update
  else
    >&2 echo "- Module \"$module_name\" already activated."
  fi
}

function update() {
  if [ -f "$active_link" ]
  then
    (
      cd "$module_name"
      bin/update.sh
      >&2 echo "- Module \"$module_name\" updated."
    )
  else
    >&2 echo "- Module \"$module_name\" not updated. Maybe you should activate it. You can use"
    >&2 echo "    \"$0\" --activate \"$module_name\""
  fi
}

function deactivate() {
  if [ -f "$active_link" ]
  then
   mv "$active_link" "$inactive_link"
    >&2 echo "- Module \"$module_name\" inactive."
  else
    >&2 echo "- Module \"$module_name\" already inactive."
  fi
}

# starting the script

cd "`dirname \"$0\"`"

active_modules="../active-modules"
inactive_modules="../inactive-modules"

active_modules="`realpath \"$active_modules\"`"
inactive_modules="`realpath \"$inactive_modules\"`"

mkdir -p "$active_modules"
mkdir -p "$inactive_modules"

cd ../modules

action_argument="$1"

shift

if [ "$action_argument" == "--activate" ] || [ "$action_argument" == "-a" ]
then
  action=activate
elif [ "$action_argument" == "--deactivate" ] || [ "$action_argument" == "-d" ]
then
  action=deactivate
elif [ "$action_argument" == "--update" ] || [ "$action_argument" == "-u" ]
then
  action=update
else
  >&2 echo "ERROR: No action was specified."
  >&2 echo "       Usage: \"$0\" (--activate|-a|--deactivate|-d|--update|-u) <modules_names>"
  >&2 echo "         --activate or -a activates a module."
  >&2 echo "           The module installs on first usage."
  >&2 echo "           The module updates (see --update) if not activated, yet."
  >&2 echo "         --deactivate or -d deactivates the module. "
  >&2 echo "           The module is not shown in the active modules directory."
  >&2 echo "           This does not delete any content of the module."
  >&2 echo "         --update or -u updates the module."
  >&2 echo "           Content may be downloaded and repositories may be pulled."
  >&2 echo "           The modules web folder is linked into the web folder."
  >&2 echo "       Possible module names are `ls`."
  exit 1
fi


# check for valid argments
if [ -z "$1" ]
then
  >&2 echo "ERROR: No module name was given."
  >&2 echo "       Possible module names are `ls`."
  exit 1
fi

# check for all modules exist before doing something
for module_name in "$@"
do 
  if ! [ -d "$module_name" ]
  then
    >&2 echo "ERROR: No module named \"$module_name\"."
    >&2 echo "       Possible module names are `ls`."
    >&2 echo "       Nothing was done."
    exit 1
  fi
  active_link="$active_modules/$module_name"
  inactive_link="$inactive_modules/$module_name"
  if [ -f "$active_link" ] && [ -f "$inactive_link" ]
  then
    >&2 echo "ERROR: Module \"$module_name\" is activated and deactivated."
    >&2 echo "       I do not know what to do. You can remove the files and try again:"
    >&2 echo "         \"$active_link\""
    >&2 echo "         \"$inactive_link\""
    exit 1
  fi
done

# do the action on the modules
for module_name in "$@"
do
  active_link="$active_modules/$module_name"
  inactive_link="$inactive_modules/$module_name"
  $action
fi
