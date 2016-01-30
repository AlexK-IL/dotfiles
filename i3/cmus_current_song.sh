#!/bin/bash
# A shell script to print current song being played on cmus

# Check if cmus is installed
if [ ! -x /usr/bin/cmus-remote ];
then
  echo "cmus not installed"
  exit
fi

# Get status of cmus
STATUS=$( cmus-remote -Q 2>/dev/null | grep "status" | cut -d " " -f 2- )
# Get Artist tag of current song
ARTIST=$( cmus-remote -Q 2>/dev/null | grep "tag artist" | cut -d " " -f 3- )
# Get Artist tag of current song
TITLE=$( cmus-remote -Q 2>/dev/null | grep "tag title" | cut -d " " -f 3- )
SHUFFLE=$( cmus-remote -Q | grep shuffle | cut -d " " -f3 )

# If not artist or title tags available, get filename
if [ -z "$ARTIST" -o -z "$TITLE" ];
then
  # Get full path to file and extract filename
  FILE=$( cmus-remote -Q 2>/dev/null | grep "file" | cut -d " " -f 2- | rev | cut -d "/" -f1 | rev )
fi

# Check if cmus is playing
if [ "$STATUS" == "playing" ];
then
  # Check if file wasn't set
  if [ -z "$FILE" ];
  then
    # Print artist - title
    echo "$ARTIST - $TITLE | shuffle $SHUFFLE" 
  else
    # Print filename
    echo "$FILE | shuffle $SHUFFLE"
  fi
else
  echo "Not Playing"
fi
