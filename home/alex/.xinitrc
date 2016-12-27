# Set languages toggle shortcut
setxkbmap -layout us,il -option grp:alt_shift_toggle

# Japanese input method framework
#export GTK_IM_MODULE='uim'
#export QT_IM_MODULE='uim'
#uim-xim &
#export XMODIFIERS='@im=uim'
#uim-toolbar-gtk3 &

# Personal key bindings
xbindkeys

# Turn numlock on
numlockx on

# Start devmon to automount USB devices
devmon &

# Start transmission daemon
transmission-daemon

# Set a background
feh --bg-scale ~/Pictures/background.jpg

# Set i3 termianl for urxvt
export $TERMINAL=urxvt

# Start dropbox
/usr/bin/dropbox &

# Start a compton daemon
compton --daemon --shadow --fading

# Suspend after 2 hours of inactivity
xautolock -time 120 -detectsleep -locker "systemctl suspend" &

# Start chosen window manager
case $2 in
i3)
	exec i3
	;;
dwm)
	exec dwm
	;;
awesome)
	exec awesome
	;;
fluxbox)
	exec startfluxbox
	;;
openbox)
	exec openbox-session
	;;
xfce4)
	exec xfce4-session
	;;
kde)
	exec startkde
	;;
gnome)
	exec gnome-session
	;;
mate)
	exec mate-session
	;;
# Unknown argument defaults to i3
*)
	exec i3
	;;
esac
