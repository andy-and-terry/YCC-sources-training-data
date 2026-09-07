#!/usr/bin/env bash
set -euo pipefail

quicksort() {
    local -n arr=$1
    local low=$2
    local high=$3
    if ((low >= high)); then
        return
    fi
    local pivot=${arr[high]}
    local i=$((low - 1))
    for ((j = low; j < high; j++)); do
        if ((arr[j] <= pivot)); then
            i=$((i + 1))
            local temp=${arr[i]}
            arr[i]=${arr[j]}
            arr[j]=$temp
        fi
    done
    local temp=${arr[i + 1]}
    arr[i + 1]=${arr[high]}
    arr[high]=$temp
    local pivot_index=$((i + 1))
    quicksort arr "$low" "$((pivot_index - 1))"
    quicksort arr "$((pivot_index + 1))" "$high"
}

numbers=(5 2 9 1 5 6 3)
quicksort numbers 0 $((${#numbers[@]} - 1))
echo "${numbers[@]}"
