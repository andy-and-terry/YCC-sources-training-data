#!/usr/bin/env bash
set -euo pipefail

# Use flock on a file descriptor to ensure only one instance holds the lock.
lockfile=$(mktemp)
trap 'rm -f "$lockfile"' EXIT

exec 9>"$lockfile"

if flock -n 9; then
    echo "first holder acquired the lock"

    # A second attempt (from a subshell with its own open of the file) fails immediately
    if ( flock -n 8 || exit 1 ) 8>"$lockfile"; then
        echo "second holder acquired the lock (unexpected)"
    else
        echo "second holder could not get the lock"
    fi

    flock -u 9
    echo "lock released"
fi

if ( flock -n 8 ) 8>"$lockfile"; then
    echo "lock is free again"
fi
