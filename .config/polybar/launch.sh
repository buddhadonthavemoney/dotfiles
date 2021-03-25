#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar >>/tmp/polybar1.log 2>&1 & disown
polybar bottom >> /tmp/polybar2.log 2>&1 & disown


rm /home/buddha/pipe1
mkfifo pipe1 

printf "hidden" > pipe1 & disown 

echo "Bars launched..."
