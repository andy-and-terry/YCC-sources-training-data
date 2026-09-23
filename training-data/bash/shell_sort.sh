#!/usr/bin/env bash
set -euo pipefail

shell_sort() {
    local -n arr=$1
    local n=${#arr[@]}
    local gap i j temp

    gap=$((n / 2))
    while ((gap > 0)); do
        for ((i = gap; i < n; i++)); do
            temp=${arr[i]}
            j=$i
            while ((j >= gap && arr[j - gap] > temp)); do
                arr[j]=${arr[j - gap]}
                j=$((j - gap))
            done
            arr[j]=$temp
        done
        gap=$((gap / 2))
    done
}

numbers=(9 5 1 4 3 8 2 7 6)
shell_sort numbers
echo "${numbers[@]}"
