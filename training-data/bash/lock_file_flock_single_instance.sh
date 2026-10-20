#!/usr/bin/env bash
set -euo pipefail

lock=$(mktemp)
exec 9>"$lock"
if flock -n 9; then
  echo "acquired"
  ( flock -n 9 && echo "child got it" ) || echo "child blocked"
else
  echo "already running"
fi
rm -f "$lock"
