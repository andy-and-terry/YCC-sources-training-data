#!/usr/bin/env bash
set -euo pipefail

rle_decode() {
    local s=$1
    local result="" count="" char
    local n=${#s}
    local i
    for ((i = 0; i < n; i++)); do
        char=${s:i:1}
        if [[ $char =~ [0-9] ]]; then
            count+="$char"
        else
            local rep
            for ((rep = 0; rep < count; rep++)); do
                result+="$char"
            done
            count=""
        fi
    done
    echo "$result"
}

rle_decode "3a3b4c1d"
rle_decode "4w3a1d1e6x"
