#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
 polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar >>/tmp/polybar1.log 2>&1 & disown
polybar bottom >> /tmp/polybar2.log 2>&1 & disown

if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
    polybar anothermonitor >>/tmp/polybar3.log 2>&1 & disown
fi

rm /home/buddha/.tray
mkfifo .tray 


printf "hidden" > .tray & disown 

echo "Bars launched..."
