#!/usr/bin/env bash
set -euo pipefail

retry_with_backoff() {
    local max_attempts=$1
    shift
    local attempt=1
    local delay=1

    until "$@"; do
        if ((attempt >= max_attempts)); then
            echo "Command failed after ${attempt} attempts" >&2
            return 1
        fi
        echo "Attempt ${attempt} failed; retrying in ${delay}s..." >&2
        sleep "$delay"
        delay=$((delay * 2))
        ((attempt++))
    done
}

attempts_needed=3
count=0
flaky_command() {
    ((count++))
    ((count >= attempts_needed))
}

retry_with_backoff 5 flaky_command
echo "Succeeded after $count attempts"
