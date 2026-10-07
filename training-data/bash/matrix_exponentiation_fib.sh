#!/usr/bin/env bash
set -euo pipefail

MOD=1000000007

# 2x2 matrices are "a b c d" strings; products stay below 2^63 because entries are < MOD.
mat_mul() {
    local a b c d e f g h
    read -r a b c d <<<"$1"
    read -r e f g h <<<"$2"
    echo "$(((a * e + b * g) % MOD)) $(((a * f + b * h) % MOD)) $(((c * e + d * g) % MOD)) $(((c * f + d * h) % MOD))"
}

fib() {
    local n=$1 r='1 0 0 1' m='1 1 1 0'
    while ((n > 0)); do
        ((n & 1)) && r=$(mat_mul "$r" "$m")
        m=$(mat_mul "$m" "$m")
        n=$((n >> 1))
    done
    read -r _ x _ _ <<<"$r"
    echo "$x"
}

out=()
for n in {0..14}; do out+=("$(fib "$n")"); done
echo "${out[*]}"
echo "fib(10^18) mod p = $(fib 1000000000000000000)"
