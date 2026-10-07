#!/usr/bin/env bash
set -euo pipefail

# Enumerate every subset using a bitmask counter.
items=(x y z)
n=${#items[@]}

for ((mask = 0; mask < (1 << n); mask++)); do
    subset=()
    for ((i = 0; i < n; i++)); do
        if ((mask & (1 << i))); then subset+=("${items[i]}"); fi
    done
    echo "{${subset[*]}}"
done
