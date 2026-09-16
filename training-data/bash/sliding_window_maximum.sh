#!/usr/bin/env bash
set -euo pipefail

nums=(1 3 -1 -3 5 3 6 7)
k=3
n=${#nums[@]}
deque=()
result=()

for ((i = 0; i < n; i++)); do
    while ((${#deque[@]} > 0)) && ((nums[${deque[-1]}] <= nums[i])); do
        unset 'deque[-1]'
        deque=("${deque[@]}")
    done
    deque+=("$i")

    if ((deque[0] <= i - k)); then
        unset 'deque[0]'
        deque=("${deque[@]}")
    fi

    if ((i >= k - 1)); then
        result+=("${nums[${deque[0]}]}")
    fi
done

echo "${result[@]}"
