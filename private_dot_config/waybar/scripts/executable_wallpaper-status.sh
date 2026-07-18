#!/bin/bash
# Tooltip del botón de wallpaper: muestra el actual

wp=$(grep -oP 'bg \K\S+' "$HOME/.config/sway/wallpaper/wallpaper.conf" 2>/dev/null)
printf '{"text": "", "tooltip": "Cambiar wallpaper\\nActual: %s"}\n' "$(basename "${wp:-ninguno}")"
