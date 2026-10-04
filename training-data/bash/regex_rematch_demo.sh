#!/usr/bin/env bash
set -euo pipefail

# Parse a log line with [[ =~ ]] and read capture groups from BASH_REMATCH
line='2024-05-17 12:34:56 ERROR [db] connection refused'
re='^([0-9]{4})-([0-9]{2})-([0-9]{2}) ([0-9:]+) ([A-Z]+) \[([a-z]+)\] (.*)$'

if [[ $line =~ $re ]]; then
    echo "year:    ${BASH_REMATCH[1]}"
    echo "month:   ${BASH_REMATCH[2]}"
    echo "day:     ${BASH_REMATCH[3]}"
    echo "time:    ${BASH_REMATCH[4]}"
    echo "level:   ${BASH_REMATCH[5]}"
    echo "module:  ${BASH_REMATCH[6]}"
    echo "message: ${BASH_REMATCH[7]}"
fi

for s in "user@example.com" "not-an-email" "a.b@c.org"; do
    if [[ $s =~ ^[[:alnum:]._-]+@[[:alnum:].-]+\.[a-z]{2,}$ ]]; then
        echo "valid:   $s"
    else
        echo "invalid: $s"
    fi
done
