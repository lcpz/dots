#!/bin/sh

# X settings
xrdb -merge .Xresources &

# IT layout
setxkbmap it &

# No mouse acceleration
xset m 1/1 0 &

# Faster keyboard auto-repeat rate
xset r rate 250 40 &

# Multiple monitor setting
#xrandr --output HDMI2 --primary &
#xrandr --output DP2 --right-of DP2 --rotate left &

# Java GUI rendering fix
wmname compiz &

# Start WM
exec awesome
