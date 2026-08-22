#!/usr/bin/env bash
set -euo pipefail

is_prime() {
    local n=$1
    if ((n < 2)); then
        return 1
    fi
    local i=2
    while ((i * i <= n)); do
        if ((n % i == 0)); then
            return 1
        fi
        ((i++))
    done
    return 0
}

for n in $(seq 2 20); do
    if is_prime "$n"; then
        printf "%d " "$n"
    fi
done
echo
