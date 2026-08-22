#!/usr/bin/env bash
set -euo pipefail

fibonacci() {
    local n=$1
    local a=0
    local b=1
    for ((i = 0; i < n; i++)); do
        printf "%d " "$a"
        local temp=$((a + b))
        a=$b
        b=$temp
    done
    echo
}

fibonacci 11
