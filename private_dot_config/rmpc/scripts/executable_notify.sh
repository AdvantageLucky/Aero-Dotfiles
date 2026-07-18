#!/usr/bin/env sh

# Directory where to store temporary data
TMP_DIR="/tmp/rmpc"

# Ensure the directory is created
mkdir -p "$TMP_DIR"

# Deduplicación: si esta misma canción ya se notificó hace menos de 5
# segundos, no volver a notificar (el hook puede dispararse varias veces
# por el mismo cambio de canción).
LAST_FILE="$TMP_DIR/last_notified"
exec 9>"$TMP_DIR/notify.lock"
flock 9
if [ "$(cat "$LAST_FILE" 2>/dev/null)" = "$FILE" ] \
    && [ $(($(date +%s) - $(stat -c %Y "$LAST_FILE"))) -lt 5 ]; then
    exit 0
fi
printf '%s' "$FILE" >"$LAST_FILE"

# Where to temporarily store the album art received from rmpc
ALBUM_ART_PATH="$TMP_DIR/notification_cover"

# Path to fallback album art if no album art is found by rmpc/mpd
# Change this to your needs
DEFAULT_ALBUM_ART_PATH="$TMP_DIR/default_album_art.jpg"

# Save album art of the currently playing song to a file
if ! rmpc albumart --output "$ALBUM_ART_PATH"; then
    # Use default album art if rmpc returns non-zero exit code
    ALBUM_ART_PATH="${DEFAULT_ALBUM_ART_PATH}"
fi

# -r con ID fijo: una notificación nueva reemplaza a la anterior en vez de
# apilarse, aunque la deduplicación falle o saltes canciones rápido.
notify-send -a rmpc -r 20712 -i "${ALBUM_ART_PATH}" "Now Playing" "$ARTIST - $TITLE"
