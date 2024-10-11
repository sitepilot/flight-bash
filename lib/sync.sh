#!/usr/bin/env bash

flight_sync() {
  case ${1-info} in
    info)
      mutagen sync list --long --label-selector=flight
      ;;
    pause)
      mutagen sync pause flight
      ;;
    resume)
      mutagen sync resume flight
      ;;
    monitor)
      mutagen sync monitor flight
      ;;
    terminate)
      mutagen sync terminate flight
      ;;
    create)
      mutagen sync create \
          --name=flight \
          --label=flight \
          --configuration-file "$FLIGHT_HOME_DIR/mutagen/mutagen.yml" \
          "$FLIGHT_SYNC_LOCAL_PATH" \
          "$FLIGHT_REMOTE_USER"@"$FLIGHT_REMOTE_HOST":"$FLIGHT_SYNC_REMOTE_PATH"
      ;;
    *)
      flight_abort "Unknown sync command [$1]"
      ;;
  esac
}
