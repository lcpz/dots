# X settings
xrdb -merge .Xresources && 

# Set X keyboard IT layout
setxkbmap -layout it &&

# Java fix
wmname LG3D &&

# Start WM 
exec awesome 
