#!/usr/bin/env bash

flight_destroy() {
  $DOCKER_COMPOSE down --remove-orphans --volumes
  rm -rf "$FLIGHT_CONFIG_DIR"
}
