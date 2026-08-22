#!/usr/bin/env bash
set -uo pipefail

attempts=0
max_attempts=3

until [[ $attempts -ge $max_attempts ]]; do
    attempts=$((attempts + 1))
    if [[ $attempts -eq 2 ]]; then
        echo "succeeded on attempt $attempts"
        break
    fi
    echo "attempt $attempts failed"
done
