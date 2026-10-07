#!/usr/bin/env bash
set -euo pipefail

collatz() {
    local n=$1 seq=("$1")
    while ((n != 1)); do
        if ((n % 2)); then n=$((3 * n + 1)); else n=$((n / 2)); fi
        seq+=("$n")
    done
    echo "${seq[*]}"
}

read -ra s <<<"$(collatz 27)"
echo "${s[*]:0:10} ..."
echo "steps for 27: $((${#s[@]} - 1))"

# Memoised step counts for the longest chain under 10000.
declare -A cache=([1]=0)
best=1 len=0
for ((start = 1; start < 10000; start++)); do
    n=$start path=()
    while [[ -z ${cache[$n]:-} ]]; do
        path+=("$n")
        if ((n % 2)); then n=$((3 * n + 1)); else n=$((n / 2)); fi
    done
    s=${cache[$n]}
    for ((i = ${#path[@]} - 1; i >= 0; i--)); do s=$((s + 1)); cache[${path[i]}]=$s; done
    ((cache[$start] > len)) && { best=$start; len=${cache[$start]}; }
done
echo "longest under 10000: $best ($len steps)"
