#!/usr/bin/env bash
set -euo pipefail

insertion_sort() {
    local -n arr=$1
    local n=${#arr[@]}
    for ((i = 1; i < n; i++)); do
        local key=${arr[i]}
        local j=$((i - 1))
        while ((j >= 0 && arr[j] > key)); do
            arr[j + 1]=${arr[j]}
            j=$((j - 1))
        done
        arr[j + 1]=$key
    done
}

data=(12 11 13 5 6)
insertion_sort data
echo "${data[@]}"
