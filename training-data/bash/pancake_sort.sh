#!/usr/bin/env bash
set -euo pipefail

flip() { # reverse a[0..k]
    local k=$1 i=0 t
    while ((i < k)); do t=${a[i]}; a[i]=${a[k]}; a[k]=$t; i=$((i + 1)); k=$((k - 1)); done
}

a=(3 6 1 9 4 2)
flips=()
for ((size = ${#a[@]}; size > 1; size--)); do
    max=0
    for ((i = 1; i < size; i++)); do ((a[i] > a[max])) && max=$i; done
    ((max == size - 1)) && continue
    if ((max > 0)); then flip "$max"; flips+=($((max + 1))); fi
    flip $((size - 1)); flips+=("$size")
done
echo "${a[*]} | flips: $(IFS=,; echo "${flips[*]}")"
