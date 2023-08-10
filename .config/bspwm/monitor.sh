#!/bin/bash
if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
    xrandr --output eDP1 --primary --mode 1920x1080 --rotate normal --output HDMI1 --mode 1920x1080 --rotate normal --left-of eDP1 
    bspc monitor HDMI1 -d I II III IV 
    #bspc monitor eDP1 -d 1 2 3 4 5 6 7 8   
    bspc monitor eDP1 -d V VII VII
else
    xrandr --output eDP1 --primary --mode 1920x1080 --rotate normal 
    bspc monitor -d I II III IV V VI VII 
fi
