#!/bin/bash
while true; do
    BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    if [ "$BATTERY" -le 20 ] && [ "$STATUS" = "Discharging" ]; then
        notify-send -u critical "Battery Low" "${BATTERY}% remaining — plug in!"
    fi
    sleep 60
done
