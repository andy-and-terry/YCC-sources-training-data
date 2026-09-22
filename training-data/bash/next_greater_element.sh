#!/usr/bin/env bash
set -euo pipefail

nums=(4 5 2 25 7 8 3)
n=${#nums[@]}
result=()
stack=()

for ((i = n - 1; i >= 0; i--)); do
    while [[ ${#stack[@]} -gt 0 && ${stack[-1]} -le ${nums[i]} ]]; do
        unset 'stack[-1]'
        stack=("${stack[@]}")
    done
    if [[ ${#stack[@]} -eq 0 ]]; then
        result[i]=-1
    else
        result[i]=${stack[-1]}
    fi
    stack+=("${nums[i]}")
done

echo "${result[@]}"
