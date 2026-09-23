#!/usr/bin/env bash
set -euo pipefail

lockfile=$(mktemp)

with_lock() {
    local label=$1
    (
        flock -x 200
        echo "$label acquired the lock"
    ) 200>"$lockfile"
}

with_lock "first"
with_lock "second"

rm -f "$lockfile"
