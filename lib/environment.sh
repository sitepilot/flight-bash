#!/usr/bin/env bash

flight_environment() {
  export FLIGHT_CONFIG_DIR=$HOME/.config/flight
  export FLIGHT_CERTS_DIR=$FLIGHT_CONFIG_DIR/certs
  export FLIGHT_ENV_FILE=$FLIGHT_CONFIG_DIR/.env
  export FLIGHT_SSL_KEY_FILE="$FLIGHT_CERTS_DIR/ssl.key"
  export FLIGHT_SSL_CRT_FILE="$FLIGHT_CERTS_DIR/ssl.crt"

  mkdir -p "$FLIGHT_CONFIG_DIR" "$FLIGHT_CERTS_DIR"
  touch "$FLIGHT_ENV_FILE"

  # shellcheck disable=SC1090
  source "$FLIGHT_ENV_FILE"

  export FLIGHT_DOMAIN=${FLIGHT_DOMAIN:-flght.dev}
  export FLIGHT_NETWORK=${FLIGHT_NETWORK:-flight}
  export FLIGHT_HTTP_PORT=${FLIGHT_HTTP_PORT:-80}
  export FLIGHT_HTTPS_PORT=${FLIGHT_HTTPS_PORT:-443}
  export FLIGHT_MAILPIT_ENABLED=${FLIGHT_MAILPIT_ENABLED:-false}
  export FLIGHT_PHP_VERSION=${FLIGHT_PHP_VERSION:-"8.3"}

  DOCKER_COMPOSE="docker compose -f $FLIGHT_HOME_DIR/compose.yml"

  if [ "${FLIGHT_MAILPIT_ENABLED}" == true ]; then
    DOCKER_COMPOSE="$DOCKER_COMPOSE -f $FLIGHT_HOME_DIR/compose.mailpit.yml"
  fi
}
