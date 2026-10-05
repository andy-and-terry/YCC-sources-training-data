#!/usr/bin/env bash
set -euo pipefail

caesar() {
    local text=$1 shift=$(( ($2 % 26 + 26) % 26 ))
    local out="" ch code base i
    for ((i = 0; i < ${#text}; i++)); do
        ch=${text:i:1}
        if [[ $ch =~ [A-Z] ]]; then base=65
        elif [[ $ch =~ [a-z] ]]; then base=97
        else out+=$ch; continue
        fi
        printf -v code '%d' "'$ch"
        printf -v ch "\\$(printf '%03o' $(( (code - base + shift) % 26 + base )))"
        out+=$ch
    done
    echo "$out"
}

enc=$(caesar "Hello, World!" 3)
echo "$enc"
caesar "$enc" -3
