#!/usr/bin/env bash
# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
is_practical() {
    local n=$1 reach=1 d mask
    for ((d = 1; d <= n; d++)); do ((n % d == 0)) && reach=$((reach | (reach << d))); done
    mask=$(((1 << (n + 1)) - 1))
    (((reach & mask) == mask))
}
out=()
for ((n = 1; n <= 40; n++)); do is_practical "$n" && out+=("$n"); done
echo "${out[*]}"
