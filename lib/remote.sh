#!/usr/bin/env bash

flight_remote() {
  case ${1-ssh} in
    ssh)
      ssh $FLIGHT_REMOTE_USER@$FLIGHT_REMOTE_HOST
      ;;
    *)
      flight_abort "Unknown remote command [$1]"
      ;;
  esac
}
