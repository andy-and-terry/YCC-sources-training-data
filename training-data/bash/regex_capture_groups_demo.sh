#!/usr/bin/env bash
set -euo pipefail

log_line="2026-09-22 14:05:33 ERROR disk usage at 92%"

if [[ $log_line =~ ^([0-9-]+)\ ([0-9:]+)\ ([A-Z]+)\ (.*)$ ]]; then
    date=${BASH_REMATCH[1]}
    time=${BASH_REMATCH[2]}
    level=${BASH_REMATCH[3]}
    message=${BASH_REMATCH[4]}
    echo "date: $date"
    echo "time: $time"
    echo "level: $level"
    echo "message: $message"
else
    echo "no match"
fi
