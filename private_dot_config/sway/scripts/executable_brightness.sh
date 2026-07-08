#!/bin/bash

# Brightness control

case $1 in
    up)
        brightnessctl set +5%
        ;;
    down)
        brightnessctl --min-value=1 set 5%-
        ;;
esac

# Get current percentage directly
VAL=$(brightnessctl -m | cut -d, -f4 | tr -d '%')

# Send notification (using a stack tag to avoid flooding)
notify-send -a "System" "Brillo" \
    -h string:x-dunst-stack-tag:bright \
    -u low "󰃠  ${VAL}%"
