#!/usr/bin/env bash
# Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
is_prime() {
    local n=$1 d
    ((n < 2)) && return 1
    for ((d = 2; d * d <= n; d++)); do ((n % d == 0)) && return 1; done
    return 0
}
out=()
for ((p = 2; p < 100; p++)); do
    if is_prime "$p" && is_prime $((p + 2)); then out+=("$p"); fi
done
echo "${out[*]}"
