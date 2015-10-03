# X settings
xrdb -merge .Xresources &&

# IT layout
setxkbmap it &&

# gnome-keyring daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh) &&
export SSH_AUTH_SOCK &&

# Start WM
exec awesome
