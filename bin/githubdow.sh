#!/bin/sh
# A script shell to download github packages
#-------------------------------------------

[ $# -eq 0 ] && { echo "Usage: $0 repository, [repository, ...]"; exit 1; }

for repo in "$@"
do
    # replace slashes for compatible filename
    filename=${repo//\//\~}
    echo $filename
    wget "https://github.com/${repo}/archive/master.zip" -O "${filename}.zip"
done
