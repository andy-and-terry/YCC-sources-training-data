#!/usr/bin/env bash
set -euo pipefail

declare -A matrix=(
    [0,0]=1 [0,1]=2 [0,2]=3
    [1,0]=4 [1,1]=5 [1,2]=6
)

for col in 0 1 2; do
    for row in 0 1; do
        printf "%d " "${matrix[$row,$col]}"
    done
    echo
done
