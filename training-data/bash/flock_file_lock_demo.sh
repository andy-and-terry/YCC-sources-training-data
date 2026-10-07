#!/usr/bin/env bash
set -euo pipefail

lockfile=$(mktemp)
trap 'rm -f "$lockfile"' EXIT

(
    flock -x 200
    echo "worker 1: acquired lock"
    sleep 0.1
    echo "worker 1: releasing lock"
) 200>"$lockfile"

(
    flock -x 200
    echo "worker 2: acquired lock"
) 200>"$lockfile"
