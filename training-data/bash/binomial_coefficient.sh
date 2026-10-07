#!/usr/bin/env bash
set -euo pipefail

# Multiplicative formula; each intermediate step stays an integer.
binom() {
    local n=$1 k=$2 r=1 i
    ((k < 0 || k > n)) && { echo 0; return; }
    ((k > n - k)) && k=$((n - k))
    for ((i = 1; i <= k; i++)); do r=$((r * (n - k + i) / i)); done
    echo "$r"
}

row=()
for ((k = 0; k <= 10; k++)); do row+=("$(binom 10 "$k")"); done
echo "C(10,k): ${row[*]}"
echo "C(52,5) = $(binom 52 5)"
echo "C(60,30) = $(binom 60 30)"
