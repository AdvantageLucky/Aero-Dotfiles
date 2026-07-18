#!/bin/env sh

LRCLIB_INSTANCE="https://lrclib.net"

# Si ya hay otra descarga en curso (hook disparado varias veces), no lanzar
# peticiones duplicadas a lrclib.
mkdir -p /tmp/rmpc
exec 9>/tmp/rmpc/fetch_lyrics.lock
flock -n 9 || exit 0

if [ "$HAS_LRC" = "false" ]; then
    mkdir -p "$(dirname "$LRC_FILE")"

    LYRICS="$(curl -X GET -sG \
        -H "Lrclib-Client: rmpc-$VERSION" \
        --data-urlencode "artist_name=$ARTIST" \
        --data-urlencode "track_name=$TITLE" \
        --data-urlencode "album_name=$ALBUM" \
        "$LRCLIB_INSTANCE/api/get" | jq -r '.syncedLyrics')"

    if [ -z "$LYRICS" ]; then
        rmpc remote --pid "$PID" status "Failed to download lyrics for $ARTIST - $TITLE" --level error
        exit
    fi

    if [ "$LYRICS" = "null" ]; then
        rmpc remote --pid "$PID" status "Lyrics for $ARTIST - $TITLE not found" --level warn
        exit
    fi

    echo "[ar:$ARTIST]" >"$LRC_FILE"
    {
        echo "[al:$ALBUM]"
        echo "[ti:$TITLE]"
    } >>"$LRC_FILE"
    echo "$LYRICS" | sed -E '/^\[(ar|al|ti):/d' >>"$LRC_FILE"

    rmpc remote --pid "$PID" indexlrc --path "$LRC_FILE"
    rmpc remote --pid "$PID" status "Downloaded lyrics for $ARTIST - $TITLE" --level info
fi
