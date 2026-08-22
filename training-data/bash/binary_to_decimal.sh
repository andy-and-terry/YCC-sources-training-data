#!/usr/bin/env bash
set -euo pipefail

binary_to_decimal() {
    local bin=$1
    local result=0
    for ((i = 0; i < ${#bin}; i++)); do
        result=$((result * 2 + ${bin:i:1}))
    done
    echo "$result"
}

binary_to_decimal "1010"
binary_to_decimal "11111111"
