#!/usr/bin/env bash
set -euo pipefail

product_except_self() {
    local a=("$@") out=() i suffix=1
    out[0]=1
    for ((i = 1; i < ${#a[@]}; i++)); do out[i]=$((out[i - 1] * a[i - 1])); done
    for ((i = ${#a[@]} - 1; i >= 0; i--)); do
        out[i]=$((out[i] * suffix))
        suffix=$((suffix * a[i]))
    done
    echo "${out[*]}"
}

for a in "1 2 3 4" "-1 1 0 -3 3" "5 7"; do
    # shellcheck disable=SC2086
    echo "[$a] -> [$(product_except_self $a)]"
done
