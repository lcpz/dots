#!/bin/bash
# ompload.sh
# upload image to omploader and print out url etc

curl -F file1=@"$1" http://ompldr.org/upload|awk '/Info:|File:|Thumbnail:|BBCode:/{gsub(/<[^>]*>/,"");print $1}'
exit
