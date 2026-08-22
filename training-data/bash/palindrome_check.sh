#!/usr/bin/env bash
set -euo pipefail

is_palindrome() {
    local s=$1
    local rev=""
    for ((i = ${#s} - 1; i >= 0; i--)); do
        rev+="${s:i:1}"
    done
    [[ "$s" == "$rev" ]]
}

for word in racecar hello level; do
    if is_palindrome "$word"; then
        echo "$word: palindrome"
    else
        echo "$word: not palindrome"
    fi
done
