#!/usr/bin/env bash
set -euo pipefail

is_anagram() {
    local a=$1
    local b=$2
    if ((${#a} != ${#b})); then
        echo "false"
        return
    fi

    local sorted_a sorted_b
    sorted_a=$(echo "$a" | grep -o . | sort | tr -d '\n')
    sorted_b=$(echo "$b" | grep -o . | sort | tr -d '\n')

    if [[ "$sorted_a" == "$sorted_b" ]]; then
        echo "true"
    else
        echo "false"
    fi
}

is_anagram "listen" "silent"
is_anagram "hello" "world"
