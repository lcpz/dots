#!/bin/sh

# X settings
xrdb -merge .Xresources &

# IT layout
setxkbmap it &

# No mouse acceleration
xset m 1/1 0 &

# Faster keyboard auto-repeat rate
xset r rate 250 50 &

# Start WM
exec awesome
