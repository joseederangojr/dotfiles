#!/bin/bash

# Clock plugin for SketchyBar
# Toggle between local and Berlin time on click
# Format: PH: MM/DD 12-hour format

# Check if we should show Berlin time (stored in a temporary file)
TOGGLE_FILE="/tmp/clock_berlin_toggle"

if [ "$SENDER" = "mouse.clicked" ]; then
    if [ -f "$TOGGLE_FILE" ]; then
        rm "$TOGGLE_FILE"
    else
        touch "$TOGGLE_FILE"
    fi
fi

if [ -f "$TOGGLE_FILE" ]; then
    # Show Berlin time
    LABEL=$(TZ='Europe/Berlin' date +"DE: %m/%d %I:%M %p")
else
    # Show local time
    LABEL=$(date +"PH: %m/%d %I:%M %p")
fi

sketchybar --set $NAME label="$LABEL"