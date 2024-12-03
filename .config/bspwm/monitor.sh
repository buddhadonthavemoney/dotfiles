#!/bin/bash
if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
    # xrandr --output  HDMI1 --primary  --mode 1920x1080 --rotate normal --output eDP1 --mode 1920x1080 --rotate normal --right-of eDP1 
    xrandr --output eDP1 --primary  --mode 1920x1080 --rotate normal --output HDMI1 --mode 1920x1080 --rotate normal --right-of eDP1 
	
    bspc monitor eDP1 -d I II III IV 
    bspc monitor HDMI1 -d V VI VII VIII
else
    xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal 
    bspc monitor -d I II III IV V VI VII VIII 
fi
