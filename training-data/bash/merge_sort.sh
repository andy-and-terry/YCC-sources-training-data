#!/usr/bin/env bash
set -euo pipefail

merge_sort() {
    local -n arr=$1
    local n=${#arr[@]}
    if ((n <= 1)); then
        return
    fi

    local mid=$((n / 2))
    local left=("${arr[@]:0:mid}")
    local right=("${arr[@]:mid}")
    merge_sort left
    merge_sort right

    local i=0 j=0 k=0
    while ((i < ${#left[@]} && j < ${#right[@]})); do
        if ((left[i] <= right[j])); then
            arr[k]=${left[i]}
            i=$((i + 1))
        else
            arr[k]=${right[j]}
            j=$((j + 1))
        fi
        k=$((k + 1))
    done
    while ((i < ${#left[@]})); do
        arr[k]=${left[i]}
        i=$((i + 1))
        k=$((k + 1))
    done
    while ((j < ${#right[@]})); do
        arr[k]=${right[j]}
        j=$((j + 1))
        k=$((k + 1))
    done
}

numbers=(5 2 9 1 5 6 3)
merge_sort numbers
echo "${numbers[@]}"
