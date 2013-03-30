#!/bin/sh
#
# ~/.xinitrc
#

# source xinitc.d scripts
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# start WM
exec awesome >> ~/.cache/awesome/stdout 2 >> ~/.cache/awesome/stderr
