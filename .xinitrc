# Start a D-Bus session + GNOME keyring
source /etc/X11/xinit/xinitrc.d/30-dbus &&
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh) &&
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK &&
export DBUS_SESSION_BUS_ADDRESS DBUS_SESSION_BUS_PID &&

# X settings
xrdb -merge .Xresources &&

# Java fix
wmname LG3D &&

# Start WM 
exec awesome >> ~/.cache/awesome/stdout 2 >> ~/.cache/awesome/stderr
