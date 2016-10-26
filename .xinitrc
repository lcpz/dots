# X settings
xrdb -merge .Xresources &&

# IT layout
setxkbmap it &&

xinput disable 8 &&
# Start WM
exec awesome
