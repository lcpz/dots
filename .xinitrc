# X settings
xrdb -merge .Xresources && 

# IT layout
setxkbmap it &&

# Start WM 
exec awesome 
