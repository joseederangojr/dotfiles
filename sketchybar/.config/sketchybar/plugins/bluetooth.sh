#!/bin/bash

# Bluetooth plugin for SketchyBar
# Shows icon with color based on Bluetooth state

# Check if Bluetooth is on
BT_POWER=$(blueutil --power)

# Check if any devices are connected
BT_CONNECTED=$(blueutil --connected | head -1)

if [ "$BT_POWER" = "1" ]; then
    if [ -n "$BT_CONNECTED" ]; then
        ICON=""      # Bluetooth icon
        COLOR=0xffa7c080  # Everforest green (connected)
    else
        ICON=""      # Bluetooth icon  
        COLOR=0xff7FBBB3  # Everforest blue (on but not connected)
    fi
else
    ICON=""      # Bluetooth off icon
    COLOR=0xffe67e80  # Everforest red (off)
fi

sketchybar --set $NAME icon="$ICON" icon.color=$COLOR label.drawing=off