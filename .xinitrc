# X settings
xrdb -merge .Xresources &&

# IT layout
setxkbmap it &&

# Fonts
xset +fb /home/luke/.fonts &&
xset fb rehash &&

# Start WM
exec awesome
