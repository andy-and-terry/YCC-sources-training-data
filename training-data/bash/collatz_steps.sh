#!/usr/bin/env bash
set -euo pipefail

collatz_steps() {
    local n=$1
    local steps=0
    while ((n != 1)); do
        if ((n % 2 == 0)); then
            ((n /= 2))
        else
            ((n = 3 * n + 1))
        fi
        ((steps++))
    done
    echo "$steps"
}

for start in 1 6 7 27; do
    echo "$start -> $(collatz_steps "$start") steps"
done
