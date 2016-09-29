# X settings
xrdb -merge .Xresources &&

# IT layout
setxkbmap it &&

# Start WM
exec awesome
#/usr/bin/start-pulseaudio-x11
