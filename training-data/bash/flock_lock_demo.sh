#!/usr/bin/env bash
set -euo pipefail

# Prevent concurrent runs with flock on a file descriptor.
lockfile=$(mktemp)
exec 9>"$lockfile"

if flock -n 9; then
    echo "lock acquired"
    # A second non-blocking attempt from a subshell fails while we hold it.
    if ! (flock -n 8) 8>"$lockfile"; then
        echo "second attempt blocked"
    fi
    flock -u 9
    echo "lock released"
fi
rm -f "$lockfile"
