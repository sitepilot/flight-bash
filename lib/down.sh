#!/usr/bin/env bash

flight_down() {
  $DOCKER_COMPOSE down --remove-orphans
}
