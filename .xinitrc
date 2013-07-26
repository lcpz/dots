#/bin/sh
#
# ~/.xinitrc
#

xrdb -merge .Xresources

wmname LG3D

exec awesome >> ~/.cache/awesome/stdout 2 >> ~/.cache/awesome/stderr
#exec $HOME/bin/start_monster
