#!/usr/bin/env bash
set -euo pipefail

# Generate all permutations of items by recursive swapping.
items=(a b c)

permute() {
    local k=$1 i tmp
    if ((k == ${#items[@]})); then
        echo "${items[*]}"
        return
    fi
    for ((i = k; i < ${#items[@]}; i++)); do
        tmp=${items[k]}; items[k]=${items[i]}; items[i]=$tmp
        permute $((k + 1))
        tmp=${items[k]}; items[k]=${items[i]}; items[i]=$tmp
    done
}

permute 0
