#!/bin/bash
# A shell script to print current song being played on cmus

if [ ! -x /usr/bin/cmus-remote ];
then
  echo "cmus isn't installed"
  exit
fi

STATUS=$( cmus-remote -Q 2>/dev/null | grep status | cut -d " " -f 2- )
FILE=$( cmus-remote -Q 2>/dev/null | grep file | cut -d " " -f 2- )

if [ "$STATUS" == "playing" ];
then
  echo "$FILE"
else
  echo "Cmus is off"
fi
