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
xmodmap ~/.Xmodmap

# Turn numlock on
numlockx on

# Start devmon to automount USB devices
devmon &

# Start transmission daemon
transmission-daemon

# Set a background
feh --bg-scale ~/Pictures/background.jpg

# Set i3 termianl
export TERMINAL=konsole

# Start dropbox
/usr/bin/dropbox &

# Start a compton daemon
compton --daemon --shadow --fading

# Suspend after 2 hours of inactivity
xautolock -time 120 -detectsleep -locker "systemctl suspend" &

# Start WM
exec i3
