#!/usr/bin/env bash
# Population count (number of set bits) for 0..15
bits() {
    local n=$1 c=0
    while (( n > 0 )); do
        (( c += n & 1, n >>= 1 ))
    done
    echo "$c"
}

for n in {0..15}; do printf '%s ' "$(bits "$n")"; done
echo
