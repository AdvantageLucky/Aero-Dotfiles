#!/bin/bash

run_once() {
    pgrep -x "$(basename "$1")" >/dev/null || "$@" &
}

# Environment
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

LOCK_SCRIPT="$HOME/.config/sway/scripts/lock.sh"

# Idle: lock at 3 min, screen off at 5, lock on suspend
if ! pgrep -x swayidle >/dev/null; then
    swayidle -w \
        timeout 180 "$LOCK_SCRIPT" \
        timeout 300 'swaymsg "output * dpms off"' \
        resume 'swaymsg "output * dpms on"' \
        before-sleep "$LOCK_SCRIPT" \
        after-resume 'swaymsg "output * dpms on"' &
fi

# Daemons
run_once mako
run_once autotiling-rs
run_once wlsunset -l 19.4 -L -99.1
pgrep -f polkit-gnome-authentication-agent-1 >/dev/null || \
    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'Windows Longhorn Plex'
gsettings set org.gnome.desktop.interface color-scheme 'default'

# micmute LED
if [[ "$(pamixer --default-source --get-mute)" == "true" ]]; then
    brightnessctl -d "platform::micmute" set 0
else
    brightnessctl -d "platform::micmute" set 1
fi
