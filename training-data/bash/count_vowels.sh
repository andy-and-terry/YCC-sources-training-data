#!/usr/bin/env bash
set -euo pipefail

count_vowels() {
    local s=$1
    local count=0
    for ((i = 0; i < ${#s}; i++)); do
        case "${s:i:1}" in
            a|e|i|o|u) count=$((count + 1)) ;;
        esac
    done
    echo "$count"
}

count_vowels "hello world"
