#!/bin/bash
playerctl metadata --format '{{status}} {{title}}' --follow | while read line; do
    STATUS=$(echo "$line" | cut -d' ' -f1)
    TITLE=$(playerctl metadata title 2>/dev/null)
    ARTIST=$(playerctl metadata artist 2>/dev/null)
    ALBUM=$(playerctl metadata album 2>/dev/null)

    if [ "$STATUS" = "Playing" ]; then
        # try to get album art
        ART_URL=$(playerctl metadata mpris:artUrl 2>/dev/null | sed 's|open.spotify.com|i.scdn.co|')
        ART_PATH="/tmp/spotify-art.jpg"

        if [ -n "$ART_URL" ]; then
            curl -s "$ART_URL" -o "$ART_PATH" 2>/dev/null
            notify-send -i "$ART_PATH" -t 3000 "$TITLE" "$ARTIST • $ALBUM"
        else
            notify-send -t 3000 "🎵 $TITLE" "$ARTIST • $ALBUM"
        fi
    fi
done
