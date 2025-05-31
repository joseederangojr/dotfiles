#!/bin/bash

# Arguments: $1 = window class/name, $2 = launch command
WINDOW_CLASS="$1"
LAUNCH_CMD="$2"

# Try to get window ID by class
WIN_ID=$(wmctrl -lx | grep -i "$WINDOW_CLASS" | awk '{print $1}' | head -n 1)

if [ -n "$WIN_ID" ]; then
    # Focus the window
    wmctrl -ia "$WIN_ID"
else
    # Launch the program
    $LAUNCH_CMD &
fi

