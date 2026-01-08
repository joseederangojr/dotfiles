#!/bin/bash

# CPU plugin - event-based using sketchybar-system-stats

# Read current mode from temp file
MODE_FILE="/tmp/sketchybar_cpu_mode"
if [ ! -f "$MODE_FILE" ]; then
    echo "usage" > "$MODE_FILE"
fi

CURRENT_MODE=$(cat "$MODE_FILE")

# Get CPU data from environment variables provided by system_stats event
CPU_USAGE=$CPU_USAGE
CPU_TEMP=$CPU_TEMP

# Determine which value to show and colors
if [ "$CURRENT_MODE" = "temp" ]; then
    # Check if temperature is valid (not negative)
    if [ -n "$CPU_TEMP" ] && [ "${CPU_TEMP%.*}" -lt 0 ]; then
        LABEL="N/A°C"
        COLOR=0xff7A8478  # Gray for invalid
    else
        # Label based on temperature ranges
        TEMP_INT=$(echo "$CPU_TEMP" | cut -d. -f1)
        if (( TEMP_INT < 60 )); then
            LABEL="Low°C"
            COLOR=0xff7FBBB3  # Blue for cool
        elif (( TEMP_INT < 75 )); then
            LABEL="Med°C"
            COLOR=0xffa7c080  # Green for normal
        elif (( TEMP_INT < 85 )); then
            LABEL="High°C"
            COLOR=0xffdbbc7f  # Yellow for warm
        else
            LABEL="Crit°C"
            COLOR=0xffe67e80  # Red for critical
        fi
    fi
else
    LABEL="${CPU_USAGE}%"
    # Everforest Dark Soft colors for usage
    if (( CPU_USAGE < 50 )); then
        COLOR=0xff7FBBB3  # Blue
    elif (( CPU_USAGE < 60 )); then
        COLOR=0xffa7c080  # Green
    elif (( CPU_USAGE < 70 )); then
        COLOR=0xffdbbc7f  # Yellow
    elif (( CPU_USAGE < 80 )); then
        COLOR=0xffe67e80  # Red
    else
        COLOR=0xffE67E80  # Red (above 80%)
    fi
fi

# Handle click events - toggle mode
# Handle click events - toggle mode
if [ "$SENDER" = "mouse.clicked" ]; then
    if [ "$CURRENT_MODE" = "usage" ]; then
        echo "temp" > "$MODE_FILE"
        # Recalculate temp display
        if [ -n "$CPU_TEMP" ] && [ "${CPU_TEMP%.*}" -lt 0 ]; then
            TEMP_LABEL="N/A°C"
            TEMP_COLOR=0xff7A8478
        else
            TEMP_INT=$(echo "$CPU_TEMP" | cut -d. -f1)
            if (( TEMP_INT < 60 )); then
                TEMP_LABEL="Low°C"
                TEMP_COLOR=0xff7FBBB3
            elif (( TEMP_INT < 75 )); then
                TEMP_LABEL="Med°C"
                TEMP_COLOR=0xffa7c080
            elif (( TEMP_INT < 85 )); then
                TEMP_LABEL="High°C"
                TEMP_COLOR=0xffdbbc7f
            else
                TEMP_LABEL="Crit°C"
                TEMP_COLOR=0xffe67e80
            fi
        fi
        sketchybar --set "$NAME" label="$TEMP_LABEL" label.color=$TEMP_COLOR
    else
        echo "usage" > "$MODE_FILE"
        sketchybar --set "$NAME" label="${CPU_USAGE}%" label.color=$COLOR
    fi
else
    # Update display
    sketchybar --set "$NAME" label="$LABEL" label.color=$COLOR
fi
