#!/usr/bin/env bash
set -euo pipefail

gcd() {
    local a=$1
    local b=$2
    while ((b != 0)); do
        local temp=$b
        b=$((a % b))
        a=$temp
    done
    echo "$a"
}

gcd 48 18
gcd 100 75
