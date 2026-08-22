#!/usr/bin/env bash
set -euo pipefail

selection_sort() {
    local -n arr=$1
    local n=${#arr[@]}
    for ((i = 0; i < n - 1; i++)); do
        local min=$i
        for ((j = i + 1; j < n; j++)); do
            if ((arr[j] < arr[min])); then
                min=$j
            fi
        done
        local temp=${arr[i]}
        arr[i]=${arr[min]}
        arr[min]=$temp
    done
}

data=(64 25 12 22 11)
selection_sort data
echo "${data[@]}"
