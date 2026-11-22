#!/usr/bin/env bash
# Sophie Germain primes: p prime and 2p + 1 prime.
is_prime() {
    local n=$1 d
    ((n < 2)) && return 1
    for ((d = 2; d * d <= n; d++)); do ((n % d == 0)) && return 1; done
    return 0
}
out=()
for ((p = 2; p < 100; p++)); do
    if is_prime "$p" && is_prime $((2 * p + 1)); then out+=("$p"); fi
done
echo "${out[*]}"
