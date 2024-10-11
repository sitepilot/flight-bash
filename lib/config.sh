#!/usr/bin/env bash

flight_config() {
  nano "$FLIGHT_ENV_FILE" || vi "$FLIGHT_ENV_FILE"
}
