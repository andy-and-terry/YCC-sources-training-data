#!/usr/bin/env bash
set -euo pipefail

arr=(5 2 9 1 5 6)
n=${#arr[@]}

for ((i = 0; i < n; i++)); do
    for ((j = 0; j < n - i - 1; j++)); do
        if ((arr[j] > arr[j + 1])); then
            tmp=${arr[j]}
            arr[j]=${arr[j + 1]}
            arr[j + 1]=$tmp
        fi
    done
done

echo "${arr[@]}"
