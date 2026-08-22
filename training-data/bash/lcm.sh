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

lcm() {
    local a=$1
    local b=$2
    local g
    g=$(gcd "$a" "$b")
    echo $((a / g * b))
}

lcm 4 6
lcm 21 6
