#!/usr/bin/env bash
set -euo pipefail

collatz() {
    local n=$1 steps=0
    local seq="$n"
    while ((n != 1)); do
        if ((n % 2 == 0)); then n=$((n / 2)); else n=$((3 * n + 1)); fi
        seq+=" $n"
        steps=$((steps + 1))
    done
    echo "$seq (steps: $steps)"
}

collatz 6
collatz 27 | awk '{print "27 ... steps:", $NF}'
