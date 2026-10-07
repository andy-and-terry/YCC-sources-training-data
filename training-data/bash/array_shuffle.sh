#!/usr/bin/env bash
set -euo pipefail

shuffle() {
    local -n arr=$1
    local i j tmp
    for ((i = ${#arr[@]} - 1; i > 0; i--)); do
        j=$((RANDOM % (i + 1)))
        tmp=${arr[i]}
        arr[i]=${arr[j]}
        arr[j]=$tmp
    done
}

RANDOM=42
cards=(ace king queen jack ten)
shuffle cards
echo "shuffled: ${cards[*]}"
echo "count preserved: ${#cards[@]}"
