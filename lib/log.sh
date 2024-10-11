#!/usr/bin/env bash

function flight_info()
{
  echo "ℹ️ $1" > /dev/stdout
}

function flight_abort()
{
  EXIT_CODE=${2:-1}
  echo "🆘 $1" > /dev/stderr
  exit "$EXIT_CODE"
}
