#!/bin/bash
img=$(mktemp /tmp/XXXXXXXXXX.png)
import -window root $img 
convert -scale 5% -blur 0x0.1 -resize 2000% $img $img
convert $img -gravity center -composite $img
# Run i3lock with custom background
i3lock  -i $img
# Remove the tmp file
rm $img
