#!/usr/bin/env bash

flight_up() {
  if [ ! -f "$FLIGHT_SSL_KEY_FILE" ] || [ ! -f "$FLIGHT_SSL_CRT_FILE" ]; then
    flight_mkcert
  fi

  $DOCKER_COMPOSE up -d --remove-orphans
}
