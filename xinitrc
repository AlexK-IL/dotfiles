# Wallpaper and colorschemes
wal -R

# Xresources
xrdb .Xresources -merge

# Turn off TV display by default
xrandr --output HDMI-0 --off

# Set languages toggle shortcut
setxkbmap -layout us,il -option grp:alt_shift_toggle

# Turn numlock on
numlockx on

# Start devmon to automount USB devices
devmon &

# Start transmission daemon
transmission-daemon

# Start a compton daemon
compton --daemon --shadow --fading

# Start redshift
redshift -l 32.333:34.86 &> /dev/null &

# Start a browser
firefox &

# Start a terminal
konsole &

# Export environment variables
export TERMINAL=konsole
export LC_CTYPE=en_US.UTF-8

exec /usr/bin/i3
