#!/usr/bin/env bash
set -euo pipefail

rle() {
    local s=$1
    local result="" count=1
    local n=${#s}
    for ((i = 1; i <= n; i++)); do
        if [[ $i -lt $n && ${s:i:1} == "${s:i-1:1}" ]]; then
            count=$((count + 1))
        else
            result+="${count}${s:i-1:1}"
            count=1
        fi
    done
    echo "$result"
}

rle "aaabbbccccd"
rle "wwwwaaadexxxxxx"
