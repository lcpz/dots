# Italian keyboard layout
setxkbmap -layout it -model logiex110

# X settings
xrdb -merge .Xresources && 

# Java fix
wmname LG3D &&

# Start WM 
exec awesome 
