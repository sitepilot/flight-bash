#!/usr/bin/env bash

flight_mkcert () {
  if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
    MKCERT="mkcert.exe"
  else
    MKCERT="mkcert"
  fi

  $MKCERT -install -key-file="$FLIGHT_SSL_KEY_FILE" \
    -cert-file="$FLIGHT_SSL_CRT_FILE" \
    "*.${FLIGHT_DOMAIN}" > /dev/null
}
