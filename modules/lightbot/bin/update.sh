#!/bin/bash

cd "`dirname $0`"

website="../web"
zipfile="../web/lightbot.zip"
lightbot_folder="$website/lightbot.com"

rm -rf "$lightbot_folder"
mkdir -p "$website"

(
  cd $website || { >&2 echo "ERROR: Could not find website directory \"$website\"." ; exit 1 ; }
  echo "downloading to `pwd`"
  wget -p -k http://lightbot.com/hocflash.html
) || { >&2 echo "ERROR: could not download." ; exit 1 ; }

echo "<html>
  <head>
    <meta http-equiv=refresh content='0; url=hocflash.html' />
  </head>
  <body>
    <h1><a href="hocflash.html">Lightbot</a></h1>
  </body>
</html>" > "$lightbot_folder"/index.html

rm -f $zipfile
zip -r -9 -o -m $zipfile $lightbot_folder

