#!/usr/bin/env bash
set -euo pipefail

# flock serializes access to a shared resource across concurrent
# invocations by holding an exclusive lock on a file descriptor.
lockfile=$(mktemp)
trap 'rm -f "$lockfile"' EXIT

critical_section() {
    local id=$1
    (
        flock -x 200
        echo "worker $id entered critical section"
        sleep 0.05
        echo "worker $id leaving critical section"
    ) 200>"$lockfile"
}

critical_section 1 &
critical_section 2 &
wait
