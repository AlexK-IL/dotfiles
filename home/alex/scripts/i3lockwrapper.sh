#!/bin/sh
# Shell script to wrap i3lock

# Change layout to english
setxkbmap us
/usr/bin/sleep 1
setxkbmap -layout us,il -option grp:alt_shift_toggle

# Lock screen
/usr/bin/i3lock --image /home/alex/Pictures/lockscreen.png --show-failed-attempts -c 000000
