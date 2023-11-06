#!/bin/bash
while true
do
  status=`acpi -b | grep -o "Discharging"`
  if [ "$status" == "Discharging" ]; then
    battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
    if [ $battery_level -le 20 ]; then
      notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
      paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
    fi
  fi
  sleep 60
done
