#!/usr/bin/env bash
set -euo pipefail

moves=0

hanoi() {
    local n=$1
    local from=$2
    local to=$3
    local via=$4

    if ((n == 0)); then
        return
    fi

    hanoi $((n - 1)) "$from" "$via" "$to"
    echo "move disk $n from $from to $to"
    moves=$((moves + 1))
    hanoi $((n - 1)) "$via" "$to" "$from"
}

hanoi 3 A C B
echo "total moves: $moves"
