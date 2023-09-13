#!/usr/bin/bash

x=$(cat < .tray) 
if [[ "$x" == "hidden" ]]; then
    # polybar-msg -p $(ps -aux | grep "polybar bottom$" | awk '{print $2}') cmd show
    polybar-msg -p $(ps -aux | grep "polybar -q bottom" | awk '{print $2}' | head -n 1) cmd show
    xdo lower $(xdo id -a "Polybar tray window")
    printf "lower" > .tray &  disown %1

elif [[ "$x" == "lower" ]]; then
    xdo raise $(xdo id -a "Polybar tray window")
    printf "raise" > .tray &
else
    # polybar-msg -p $(ps -aux | grep "polybar bottom$" | awk '{print $2}') cmd hide
    polybar-msg -p $(ps -aux | grep "polybar -q bottom" | awk '{print $2}' | head -n 1) cmd hide
    printf "hidden" > .tray &
fi

