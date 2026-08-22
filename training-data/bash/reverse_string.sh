#!/usr/bin/env bash
set -euo pipefail

reverse_string() {
    local s=$1
    local rev=""
    for ((i = ${#s} - 1; i >= 0; i--)); do
        rev+="${s:i:1}"
    done
    echo "$rev"
}

reverse_string "hello world"
