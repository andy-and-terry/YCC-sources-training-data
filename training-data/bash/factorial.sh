#!/usr/bin/env bash
set -euo pipefail

factorial() {
    local n=$1
    local result=1
    for ((i = 2; i <= n; i++)); do
        result=$((result * i))
    done
    echo "$result"
}

for n in 0 1 5 10; do
    factorial "$n"
done
