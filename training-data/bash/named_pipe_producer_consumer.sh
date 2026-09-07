#!/usr/bin/env bash
set -euo pipefail

pipe=$(mktemp -u)
mkfifo "$pipe"

producer() {
    for item in one two three; do
        echo "$item" >"$pipe"
    done
}

producer &
producer_pid=$!

while IFS= read -r item; do
    echo "consumed: $item"
done <"$pipe"

wait "$producer_pid"
rm -f "$pipe"
