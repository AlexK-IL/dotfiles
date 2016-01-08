#!/bin/sh

#-------------------------
# Original xinitrc section
#-------------------------

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#-------------------------
# Original xinitrc section
#-------------------------

# Set languages toggle shortcut
setxkbmap -layout us,il -option grp:alt_shift_toggle

# Personal key bindings
xbindkeys

# Turn numlock on
numlockx on

# Start devmon to automount USB devices
devmon &

# Start transmission daemon
transmission-daemon

# Set a background
feh --bg-scale ~/.config/background.jpg

# Start chosen window manager
session=$2
case $session in
    "i3") exec i3;;
    # No known session, open i3 as default
    *) exec i3;;
esac
