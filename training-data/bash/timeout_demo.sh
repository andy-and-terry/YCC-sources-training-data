#!/usr/bin/env bash
set -uo pipefail

if timeout 1 sleep 0.1; then
    echo "completed in time"
else
    echo "timed out"
fi

if timeout 0.1 sleep 1; then
    echo "completed in time"
else
    echo "timed out"
fi
