#!/bin/sh

# X settings
xrdb -merge .Xresources &

# IT layout
setxkbmap it &

# No mouse acceleration
xset m 1/1 0 &

# Faster keyboard auto-repeat rate
xset r rate 250 50 &

# Multiple monitor setting
xrandr --output HDMI-2 --primary &
xrandr --output HDMI-3 --right-of HDMI-2 --rotate left &

# Java GUI rendering fix
wmname compiz &

# Start WM
exec awesome
