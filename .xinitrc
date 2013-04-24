#!/bin/sh
#
# ~/.xinitrc
#

xrdb .Xdefaults
exec awesome >> ~/.cache/awesome/stdout 2 >> ~/.cache/awesome/stderr

