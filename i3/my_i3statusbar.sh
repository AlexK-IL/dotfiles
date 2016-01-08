#!/bin/bash

# shell script to prepend i3status with more stuff

i3status --config /home/alex/.config/i3/i3status.conf | while :
do
        read line
	currentlayout="^i(/home/alex/.config/i3/icons/pacman.xbm) $(xkb-switch)"
        echo "$currentlayout $line" || exit 1
done
