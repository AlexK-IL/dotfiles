#!/bin/sh

# Make sure to set keyboard layout to english before locking the screen
setxkbmap us & betterlockscreen --lock & setxkbmap -layout us,il -option grp:alt_shift_toggle
