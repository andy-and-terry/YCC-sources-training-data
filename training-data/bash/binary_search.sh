#!/usr/bin/env bash
set -euo pipefail

binary_search() {
    local -n arr=$1
    local target=$2
    local low=0
    local high=$((${#arr[@]} - 1))

    while ((low <= high)); do
        local mid=$(((low + high) / 2))
        if ((arr[mid] == target)); then
            echo "$mid"
            return 0
        elif ((arr[mid] < target)); then
            low=$((mid + 1))
        else
            high=$((mid - 1))
        fi
    done
    echo -1
}

sorted=(1 3 5 7 9 11 13)
binary_search sorted 7
binary_search sorted 4
