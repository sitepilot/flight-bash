#!/usr/bin/env bash

function flight_php()
{
  docker run --rm -q -v $PWD:/app/files ghcr.io/sitepilot/php:"$FLIGHT_PHP_VERSION" "$@"
}
