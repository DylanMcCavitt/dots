#!/bin/bash

next() { osascript -e 'tell application "Spotify" to next track'; }
back() { osascript -e 'tell application "Spotify" to previous track'; }
play() { osascript -e 'tell application "Spotify" to playpause'; }

update() {
    PLAYER_STATE=$(osascript -e 'tell application "Spotify" to player state as string' 2>/dev/null)

    if [[ "$PLAYER_STATE" == "playing" ]]; then
        TRACK=$(osascript -e 'tell application "Spotify" to name of current track')
        ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track')
        sketchybar --set spotify icon="󰓇" label="${ARTIST:0:15} - ${TRACK:0:20}"
    elif [[ "$PLAYER_STATE" == "paused" ]]; then
        sketchybar --set spotify icon="󰏤" label="Paused"
    else
        sketchybar --set spotify label="" icon=""
    fi
}

case "$SENDER" in
    "mouse.clicked")
        case "$NAME" in
            "spotify.next") next; update ;;
            "spotify.back") back; update ;;
            "spotify.play") play; update ;;
            *) ;;
        esac ;;
    *) update ;;
esac
