#!/usr/bin/env sh

# Ejecutado por rmpc en cada cambio de canción (ver on_song_change en config.ron)

"$HOME/.config/rmpc/scripts/notify.sh" &
"$HOME/.config/rmpc/scripts/fetch_lyrics.sh" &
wait
