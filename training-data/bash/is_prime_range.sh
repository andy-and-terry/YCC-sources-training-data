#!/usr/bin/env bash
set -euo pipefail

is_prime() {
    local n=$1
    ((n < 2)) && return 1
    for ((i = 2; i * i <= n; i++)); do
        ((n % i == 0)) && return 1
    done
    return 0
}

for n in $(seq 2 30); do
    if is_prime "$n"; then
        printf "%d " "$n"
    fi
done
echo
