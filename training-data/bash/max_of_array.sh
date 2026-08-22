#!/usr/bin/env bash
set -euo pipefail

max_of_array() {
    local -n arr=$1
    local max=${arr[0]}
    for v in "${arr[@]}"; do
        if ((v > max)); then
            max=$v
        fi
    done
    echo "$max"
}

data=(5 3 8 1 9 2)
max_of_array data
