#!/bin/sh
# Shell script to wrap rofi

THEME=/usr/share/rofi/themes/solarized.rasi 

/usr/bin/rofi -theme $THEME -lines 5 "$@"
