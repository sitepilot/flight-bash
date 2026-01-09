#!/usr/bin/env bash

flight_mkcert () {
  if grep -qi microsoft /proc/sys/kernel/osrelease; then
    MKCERT="mkcert.exe"
  else
    MKCERT="mkcert"
  fi

  $MKCERT -install -key-file="$FLIGHT_SSL_KEY_FILE" \
    -cert-file="$FLIGHT_SSL_CRT_FILE" \
    "*.${FLIGHT_DOMAIN}" > /dev/null
}
