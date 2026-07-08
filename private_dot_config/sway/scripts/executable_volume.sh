#!/bin/bash

# Volume and Mic control

case $1 in
    up)
        CUR=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po "\d+(?=%)" | head -1)
        if (( CUR + 5 >= 100 )); then
            pactl set-sink-volume @DEFAULT_SINK@ 100%
        else
            pactl set-sink-volume @DEFAULT_SINK@ +5%
        fi
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    mic-mute)
        pamixer --default-source -t
        ;;
esac

# Get volume percentage
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po "\d+(?=%)" | head -1)
MUTE_STATUS=$(pactl get-sink-mute @DEFAULT_SINK@)
MIC_STATUS=$(pamixer --default-source --get-mute)

if [[ "$1" == "mic-mute" ]]; then
    if [[ "$MIC_STATUS" == "true" ]]; then
        notify-send -a "System" "Micrófono" -h string:x-dunst-stack-tag:mic -u low "Silenciado  "
        brightnessctl -d "platform::micmute" set 0
    else
        notify-send -a "System" "Micrófono" -h string:x-dunst-stack-tag:mic -u low "Activo "
        brightnessctl -d "platform::micmute" set 1
    fi
else
    if [[ "$MUTE_STATUS" == *"yes"* ]]; then
        notify-send -a "System" "Volumen" -h string:x-canonical-private-synchronous:volume -u low "Silenciado 󰝟 "
    else
        notify-send -a "System" "Volumen" -h string:x-canonical-private-synchronous:volume -u low "󰕾  ${VOL}%"
    fi
fi
