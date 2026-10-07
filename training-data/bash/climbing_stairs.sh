#!/usr/bin/env bash
set -euo pipefail

climb() {
    local n=$1 i s
    shift
    local steps=("$@")
    ((${#steps[@]})) || steps=(1 2)
    local ways=(1)
    for ((i = 1; i <= n; i++)); do
        ways[i]=0
        for s in "${steps[@]}"; do
            ((s <= i)) && ways[i]=$((ways[i] + ways[i - s]))
        done
    done
    echo "${ways[n]}"
}

out=()
for n in {1..10}; do out+=("$(climb "$n")"); done
echo "${out[*]}"
echo "n=10 with steps {1,3,5}: $(climb 10 1 3 5)"
