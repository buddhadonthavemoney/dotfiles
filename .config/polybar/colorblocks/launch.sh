#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/colorblocks"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar -q main -c "$DIR"/config.ini >>/tmp/polybar1.log 2>&1 & 
polybar -q bottom -c "$DIR"/config.ini >> /tmp/polybar2.log 2>&1 &

if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
    polybar -q another_monitor -c "$DIR"/config.ini >>/tmp/polybar3.log 2>&1 & 
    echo fuckyou >>/tmp/polyabar3.log
fi


rm /home/buddha/.tray
mkfifo .tray 


printf "hidden" > .tray & disown 

echo "Bars launched..."
