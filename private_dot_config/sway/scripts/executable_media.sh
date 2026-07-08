#!/bin/bash

# Media control (playerctl) for Frutiger Aero theme

case $1 in
    play-pause) playerctl play-pause ;;
    next)       playerctl next ;;
    prev)       playerctl previous ;;
esac

# breve espera para que el reproductor actualice la metadata
sleep 0.3

STATUS=$(playerctl status 2>/dev/null) || exit 0
TITLE=$(playerctl metadata title 2>/dev/null)
ARTIST=$(playerctl metadata artist 2>/dev/null)
ART_URL=$(playerctl metadata mpris:artUrl 2>/dev/null)

# resolver la caratula: local directa, remota se cachea por url
ICON=""
case $ART_URL in
    file://*)
        ICON=$(printf '%b' "${ART_URL#file://}" | sed 's/%\([0-9A-Fa-f][0-9A-Fa-f]\)/\\x\1/g')
        ICON=$(printf '%b' "$ICON")
        ;;
    http*)
        ICON="$XDG_RUNTIME_DIR/media-cover-$(md5sum <<< "$ART_URL" | cut -d' ' -f1)"
        [[ -s "$ICON" ]] || curl -sf --max-time 2 "$ART_URL" -o "$ICON" || ICON=""
        ;;
esac

if [[ "$STATUS" == "Playing" ]]; then
    STATE="󰐊"
else
    STATE="󰏤"
fi

notify-send -a "System" ${ICON:+-i "$ICON"} \
    -h string:x-canonical-private-synchronous:media -u low \
    "$STATE  ${TITLE:-Sin título}" "${ARTIST}"
