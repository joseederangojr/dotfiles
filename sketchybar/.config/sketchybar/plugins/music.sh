#!/bin/sh

# Music/Spotify plugin

# Get current track info from Spotify
SPOTIFY_RUNNING=$(pgrep -x "Spotify" > /dev/null && echo "running" || echo "stopped")

if [ "$SPOTIFY_RUNNING" = "running" ]; then
  # Get track info using osascript
  TRACK_INFO=$(osascript -e '
    tell application "Spotify"
      if player state is not stopped then
        set trackName to name of current track
        set artistName to artist of current track
        if player state is playing then
            set playState to "▶"
        else
            set playState to "⏸"
        end if
        return playState & " " & artistName & " - " & trackName
      else
        return "No Track"
      end if
    end tell
  ' 2>/dev/null)
  
  if [ -n "$TRACK_INFO" ] && [ "$TRACK_INFO" != "No Track" ]; then
    sketchybar --set "$NAME" icon="" label="$TRACK_INFO" icon.color=0xffA7C080
  else
    sketchybar --set "$NAME" icon="" label="Not Playing" icon.color=0xff859289
  fi
else
  sketchybar --set "$NAME" icon="" label="Spotify Closed" icon.color=0xff7A8478
fi

# Handle click events - play/pause
if [ "$SENDER" = "mouse.clicked" ]; then
  if [ "$SPOTIFY_RUNNING" = "running" ]; then
    osascript -e 'tell application "Spotify" to playpause'
  else
    osascript -e 'tell application "Spotify" to launch'
  fi
fi