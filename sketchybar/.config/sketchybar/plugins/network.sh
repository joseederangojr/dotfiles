#!/bin/bash

# Network plugin - event-based using sketchybar-system-stats

# Read current mode from temp file
MODE_FILE="/tmp/sketchybar_network_mode"
if [ ! -f "$MODE_FILE" ]; then
    echo "down" > "$MODE_FILE"
fi

CURRENT_MODE=$(cat "$MODE_FILE")

# Get network speeds from environment variables (in KB/s)
DOWNLOAD_KB=${NETWORK_RX_en0:-0}
UPLOAD_KB=${NETWORK_TX_en0:-0}

# Convert to MB/s
if [ "$DOWNLOAD_KB" != "0" ]; then
    DOWNLOAD_MB=$(echo "scale=1; $DOWNLOAD_KB / 1024" | bc)
else
    DOWNLOAD_MB="0.0"
fi

if [ "$UPLOAD_KB" != "0" ]; then
    UPLOAD_MB=$(echo "scale=1; $UPLOAD_KB / 1024" | bc)
else
    UPLOAD_MB="0.0"
fi

# Determine which value to show and icon
if [ "$CURRENT_MODE" = "up" ]; then
    VALUE="${UPLOAD_MB}MB/s"
    ICON="↑"
    # Color based on upload speed
    UPLOAD_INT=$(echo "$UPLOAD_MB" | cut -d. -f1)
    if (( UPLOAD_INT > 5 )); then
        COLOR=0xffE67E80  # Red for high upload
    elif (( UPLOAD_INT > 2 )); then
        COLOR=0xffDBBC7F  # Yellow for medium upload
    else
        COLOR=0xff7FBBB3  # Blue for low upload
    fi
else
    VALUE="${DOWNLOAD_MB}MB/s"
    ICON="↓"
    # Color based on download speed
    DOWNLOAD_INT=$(echo "$DOWNLOAD_MB" | cut -d. -f1)
    if (( DOWNLOAD_INT > 10 )); then
        COLOR=0xffE67E80  # Red for high download
    elif (( DOWNLOAD_INT > 4 )); then
        COLOR=0xffDBBC7F  # Yellow for medium download
    else
        COLOR=0xffA7C080  # Green for low download
    fi
fi

# Handle click events - toggle mode
if [ "$SENDER" = "mouse.clicked" ]; then
    if [ "$CURRENT_MODE" = "down" ]; then
        echo "up" > "$MODE_FILE"
        sketchybar --set "$NAME" label="${UPLOAD_MB}MB/s" icon="󰕒" label.color=$COLOR
    else
        echo "down" > "$MODE_FILE"
        sketchybar --set "$NAME" label="${DOWNLOAD_MB}MB/s" icon="󰇚" label.color=$COLOR
    fi
else
    # Update display
    sketchybar --set "$NAME" label="$VALUE" icon="$ICON" label.color=$COLOR
fi