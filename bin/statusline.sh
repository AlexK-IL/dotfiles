#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
	read line
	currentlayout="$(xkb-switch)"
	echo "$currentlayout | $line" || exit 1
done
