# X settings
xrdb -merge .Xresources &&

# IT layout
setxkbmap it &&

# No mouse acceleration
xset m 1/1 0 &&

# Multiple monitor setting
xrandr --output DP2 --primary &&
xrandr --output HDMI2 --right-of DP2 --rotate left &&

# Java GUI rendering fix
wmname LG3D &&

# Export local executables
export PATH=$PATH:/home/luca/bin &&

# Start WM
exec awesome
