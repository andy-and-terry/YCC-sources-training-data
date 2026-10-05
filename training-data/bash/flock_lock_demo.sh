#!/usr/bin/env bash
set -euo pipefail

lockfile=$(mktemp)
trap 'rm -f "$lockfile"' EXIT

exec 9>"$lockfile"
if flock -n 9; then
    echo "lock acquired"
    # A second non-blocking attempt on a fresh descriptor fails.
    if ! (exec 8>"$lockfile"; flock -n 8); then
        echo "second lock attempt refused"
    fi
    flock -u 9
    echo "lock released"
else
    echo "could not acquire lock"
fi
