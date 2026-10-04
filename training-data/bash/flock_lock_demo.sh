#!/usr/bin/env bash
set -euo pipefail

lockfile=$(mktemp)
trap 'rm -f "$lockfile"' EXIT

run_exclusive() {
    local label=$1
    (
        flock -n 9 || { echo "$label: lock busy, skipping"; exit 0; }
        echo "$label: acquired lock"
        sleep 0.2
        echo "$label: releasing lock"
    ) 9>"$lockfile"
}

run_exclusive "first"

# Hold the lock in the background, then try to take it again.
( flock 9; sleep 0.5 ) 9>"$lockfile" &
sleep 0.1
run_exclusive "second"
wait
