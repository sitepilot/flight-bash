#!/usr/bin/env bash

flight_reboot() {
  $DOCKER_COMPOSE up -d --remove-orphans --force-recreate
}