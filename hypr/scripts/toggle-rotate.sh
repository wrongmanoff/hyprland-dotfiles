#!/bin/bash

if hyprctl monitors | grep -q "transform: 0"; then
    hyprctl keyword monitor "eDP-1,1920x1080@144,0x0,1.2,transform,2"
    notify-send "Display" "Landscape Mode 180° "
else
    hyprctl keyword monitor "eDP-1,1920x1080@144,0x0,1.2,transform,0"
    notify-send "Display" "Landscape Mode"
fi