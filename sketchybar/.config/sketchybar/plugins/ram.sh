#!/bin/bash

# RAM plugin - event-based using sketchybar-system-stats

# Read current mode from temp file
MODE_FILE="/tmp/sketchybar_ram_mode"
if [ ! -f "$MODE_FILE" ]; then
    echo "gb" > "$MODE_FILE"
fi

CURRENT_MODE=$(cat "$MODE_FILE")

# Get RAM usage from environment variable provided by system_stats event
PERCENT=$RAM_USAGE
USED_GB=$RAM_USED

# Determine which value to show
if [ "$CURRENT_MODE" = "percent" ]; then
    LABEL="${PERCENT}%"
else
    LABEL="${USED_GB}GB"
fi

# Handle click events - toggle mode
if [ "$SENDER" = "mouse.clicked" ]; then
    if [ "$CURRENT_MODE" = "gb" ]; then
        echo "percent" > "$MODE_FILE"
        sketchybar --set "$NAME" label="${PERCENT}%" label.color=$COLOR
    else
        echo "gb" > "$MODE_FILE"
        sketchybar --set "$NAME" label="${USED_GB}GB" label.color=$COLOR
    fi
else
    # Update display
    sketchybar --set "$NAME" label="$LABEL" label.color=$COLOR
fi

# Everforest Dark Soft colors (with SketchyBar 0xAARRGGBB format)
# Convert to integer for comparison
PERCENT_INT=$(echo "$PERCENT" | cut -d. -f1)

if (( PERCENT_INT < 50 )); then
  COLOR=0xff7FBBB3  # Blue
elif (( PERCENT_INT < 60 )); then
  COLOR=0xffa7c080  # Green
elif (( PERCENT_INT < 70 )); then
  COLOR=0xffdbbc7f  # Yellow
elif (( PERCENT_INT < 80 )); then
  COLOR=0xffe67e80  # Red
else
  COLOR=0xffE67E80  # Red (above 80%)
fi

# Update SketchyBar item
sketchybar --set ram label="$LABEL" label.color=$COLOR
