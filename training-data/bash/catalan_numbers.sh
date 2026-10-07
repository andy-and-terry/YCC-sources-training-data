#!/usr/bin/env bash
set -euo pipefail

# C(0)=1, C(n+1) = sum C(i)*C(n-i); fits in 64-bit up to C(35).
c=(1)
for ((n = 1; n <= 20; n++)); do
    s=0
    for ((i = 0; i < n; i++)); do s=$((s + c[i] * c[n - 1 - i])); done
    c[n]=$s
done
echo "${c[*]}"

# Closed form check: C(n) = binom(2n, n) / (n + 1)
binom() { local n=$1 k=$2 r=1 i; for ((i = 1; i <= k; i++)); do r=$((r * (n - k + i) / i)); done; echo "$r"; }
echo "C(15) via binomial: $(($(binom 30 15) / 16)) (table: ${c[15]})"
