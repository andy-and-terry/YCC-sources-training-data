#!/usr/bin/env bash
set -euo pipefail

next_n() { local s=$1 t=0 i d; for ((i = 0; i < ${#s}; i++)); do d=${s:i:1}; t=$((t + d * d)); done; echo "$t"; }

is_happy() {
    local slow=$1 fast=$1
    while :; do
        slow=$(next_n "$slow")
        fast=$(next_n "$(next_n "$fast")")
        ((slow == fast)) && break
    done
    ((slow == 1))
}

happy=()
for n in {1..50}; do is_happy "$n" && happy+=("$n"); done
echo "happy <= 50: ${happy[*]}"

n=19 chain=()
while ((n != 1)); do chain+=("$n"); n=$(next_n "$n"); done
chain+=(1)
echo "chain for 19: ${chain[*]}"
