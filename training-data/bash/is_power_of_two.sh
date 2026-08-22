#!/usr/bin/env bash
set -euo pipefail

is_power_of_two() {
    local n=$1
    ((n > 0)) && (( (n & (n - 1)) == 0 ))
}

for n in 1 2 3 4 16 18; do
    if is_power_of_two "$n"; then
        echo "$n: power of two"
    else
        echo "$n: not a power of two"
    fi
done
