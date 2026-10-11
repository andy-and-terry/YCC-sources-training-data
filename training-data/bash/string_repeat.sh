#!/usr/bin/env bash
# Repeat a string N times without external tools.
repeat() {
    local s=$1 n=$2 out=""
    for ((i = 0; i < n; i++)); do out+="$s"; done
    printf '%s\n' "$out"
}
repeat "ab" 4
repeat "-=" 10
printf '%*s\n' 8 '' | tr ' ' '*'
