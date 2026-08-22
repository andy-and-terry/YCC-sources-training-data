#!/usr/bin/env bash
set -euo pipefail

first_repeated() {
    local s=$1
    declare -A seen
    for ((i = 0; i < ${#s}; i++)); do
        local ch=${s:i:1}
        if [[ -n "${seen[$ch]:-}" ]]; then
            echo "$ch"
            return
        fi
        seen[$ch]=1
    done
    echo "none"
}

first_repeated "swiss"
