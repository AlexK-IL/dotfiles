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
feh --bg-scale ~/Pictures/background.jpg

# Set i3 termianl for urxvt
export $TERMINAL=urxvt

# Start dropbox
/usr/bin/dropbox &

# Start skype
skype

# Start a compton daemon
compton --daemon --shadow --fading

# Start insync (for google drive synchronizing)
insync start

# Auto lock after 10 minutes of inactivity
xautolock -time 10 -detectsleep -locker "lockscreen" &

# Suspend after 30 minutes of inactivity
xautolock -time 30 -detectsleep -locker "systemctl suspend" &

# Start chosen window manager
case $2 in
i3)
	exec i3
	;;
# Unknown argument defaults to i3
*)
	exec i3
	;;
esac
