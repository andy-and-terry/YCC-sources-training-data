#!/usr/bin/env bash
set -euo pipefail

counting_sort() {
    local -n arr=$1
    local n=${#arr[@]}
    if ((n == 0)); then
        return
    fi

    local max=${arr[0]}
    local val
    for val in "${arr[@]}"; do
        if ((val > max)); then
            max=$val
        fi
    done

    local -a counts
    local i
    for ((i = 0; i <= max; i++)); do
        counts[i]=0
    done
    for val in "${arr[@]}"; do
        counts[val]=$((counts[val] + 1))
    done

    local pos=0
    for ((i = 0; i <= max; i++)); do
        while ((counts[i] > 0)); do
            arr[pos]=$i
            pos=$((pos + 1))
            counts[i]=$((counts[i] - 1))
        done
    done
}

numbers=(5 2 9 1 5 6 3 0 9)
counting_sort numbers
echo "${numbers[@]}"
