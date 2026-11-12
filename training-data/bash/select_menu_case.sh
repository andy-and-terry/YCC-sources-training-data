#!/usr/bin/env bash
choice=${1:-start}
case "$choice" in
  start|run) echo starting ;;
  stop) echo stopping ;;
  [0-9]*) echo "number $choice" ;;
  *) echo "unknown: $choice" ;;
esac
