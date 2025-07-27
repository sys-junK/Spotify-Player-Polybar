#!/bin/bash

get_spotify_status() {
  playerctl --player=spotify status 2>/dev/null
}

get_spotify_metadata() {
  playerctl --player=spotify metadata --format "{{ artist }} - {{ title }}" 2>/dev/null
}

print_spotify_info() {
  STATUS=$(get_spotify_status)
  METADATA=$(get_spotify_metadata)

  if [ "$STATUS" = "Playing" ]; then
    echo "󰏤 $METADATA" 
  elif [ "$STATUS" = "Paused" ]; then
    echo "󰐊 $METADATA"
  else
    echo "No media player found"
  fi
}

case "$1" in
  "play-pause")
  playerctl --player=spotify play-pause 2>/dev/null
  ;;
  "next")
  playerctl --player=spotify next 2>/dev/null
  ;;
  "previous")
  playerctl --player=spotify previous 2>/dev/null
  ;;
  *)
  print_spotify_info
  ;;
esac
