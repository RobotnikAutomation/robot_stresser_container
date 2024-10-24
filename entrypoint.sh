#!/bin/bash
set -e

function entrypoint_log() {
  if [ -z "${ENTRYPOINT_QUIET_LOGS:-}" ]; then
    echo "$@"
  fi
}

function run_commands() {
  if [ -z "$*" ]; then
    exec_cmd="/usr/bin/ros2 -c ${CPU}"
  else
    exec_cmd="/usr/bin/ros2 ${*}"
  fi
  entrypoint_log "Executing ${exec_cmd}"
  exec /usr/local/bin/tini -- ${exec_cmd}
}

function main() {
  run_commands "${@}"
}

main "${@}"
exit $?
