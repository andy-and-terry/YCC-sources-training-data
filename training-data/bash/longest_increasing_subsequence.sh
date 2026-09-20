#!/usr/bin/env bash
set -euo pipefail

longest_increasing_subsequence() {
    local -n arr=$1
    local n=${#arr[@]}
    local -a lengths
    local i j best=0

    for ((i = 0; i < n; i++)); do
        lengths[i]=1
    done

    for ((i = 1; i < n; i++)); do
        for ((j = 0; j < i; j++)); do
            if ((arr[j] < arr[i] && lengths[j] + 1 > lengths[i])); then
                lengths[i]=$((lengths[j] + 1))
            fi
        done
    done

    for ((i = 0; i < n; i++)); do
        if ((lengths[i] > best)); then
            best=${lengths[i]}
        fi
    done

    echo "$best"
}

sequence=(10 9 2 5 3 7 101 18)
longest_increasing_subsequence sequence
