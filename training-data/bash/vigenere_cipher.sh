#!/usr/bin/env bash
set -euo pipefail

# Vigenere cipher; non-letters pass through and do not advance the key. Case is preserved.
vigenere() {
    local text=$1 key=${2^^} dir=$3 out='' i k=0 ch base shift o
    for ((i = 0; i < ${#text}; i++)); do
        ch=${text:i:1}
        if [[ $ch == [A-Z] ]]; then base=65
        elif [[ $ch == [a-z] ]]; then base=97
        else out+=$ch; continue; fi
        printf -v shift '%d' "'${key:k % ${#key}:1}"
        shift=$(((shift - 65) * dir))
        printf -v o '%d' "'$ch"
        printf -v ch "\\x$(printf '%x' $(((o - base + shift + 26) % 26 + base)))"
        out+=$ch; k=$((k + 1))
    done
    echo "$out"
}

plain='Attack at dawn!'
enc=$(vigenere "$plain" LEMON 1)
echo "$enc"
echo "$(vigenere "$enc" LEMON -1)"
