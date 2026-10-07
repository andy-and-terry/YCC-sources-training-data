#!/usr/bin/env bash
set -euo pipefail

# f[e] = floors coverable with the current number of moves and e eggs.
egg_drop() {
    local eggs=$1 floors=$2 moves=0 e
    local f=()
    for ((e = 0; e <= eggs; e++)); do f[e]=0; done
    while ((f[eggs] < floors)); do
        moves=$((moves + 1))
        for ((e = eggs; e >= 1; e--)); do f[e]=$((f[e] + f[e - 1] + 1)); done
    done
    echo "$moves"
}

for pair in "1 10" "2 10" "2 100" "3 100" "4 5000"; do
    read -r e f <<<"$pair"
    printf 'eggs=%d floors=%-5d -> %d drops\n' "$e" "$f" "$(egg_drop "$e" "$f")"
done
