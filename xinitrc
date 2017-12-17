# Load dark solarized theme for X Windows
xrdb -merge .config/XSolarizedTheme

# Set languages toggle shortcut
setxkbmap -layout us,il -option grp:alt_shift_toggle

# Turn numlock on
numlockx on

# Set a background
feh --bg-scale ~/bg.jpg

# Start devmon to automount USB devices
devmon &

# Start transmission daemon
transmission-daemon

# Start a compton daemon
compton --daemon --shadow --fading

# Export environment variables
export TERMINAL=uxterm
export GTK_THEME=NumixSolarizedDarkBlue
export QT_QPA_PLATFORMTHEME=gtk2

exec /usr/bin/i3
