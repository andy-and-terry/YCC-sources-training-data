#!/usr/bin/env bash
set -euo pipefail

caesar_encrypt() {
    local text=$1 shift_by=$2
    local result="" i ch code base

    for ((i = 0; i < ${#text}; i++)); do
        ch=${text:i:1}
        if [[ "$ch" =~ [a-z] ]]; then
            base=$(printf '%d' "'a")
            code=$(printf '%d' "'$ch")
            code=$(((code - base + shift_by) % 26 + base))
            result+=$(printf \\$(printf '%03o' "$code"))
        elif [[ "$ch" =~ [A-Z] ]]; then
            base=$(printf '%d' "'A")
            code=$(printf '%d' "'$ch")
            code=$(((code - base + shift_by) % 26 + base))
            result+=$(printf \\$(printf '%03o' "$code"))
        else
            result+="$ch"
        fi
    done
    echo "$result"
}

caesar_encrypt "Hello, World!" 3
