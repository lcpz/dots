# X settings
xrdb -merge .Xresources 

# Java fix
#wmname LG3D

# Start WM 
exec awesome >> ~/.cache/awesome/stdout 2 >> ~/.cache/awesome/stderr
