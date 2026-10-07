#!/usr/bin/env bash
set -euo pipefail

longest_unique() {
    local s=$1 start=0 best_start=0 best_len=0 i c
    local -A last=()
    for ((i = 0; i < ${#s}; i++)); do
        c=${s:i:1}
        if [[ -n ${last[$c]:-} ]] && ((last[$c] >= start)); then start=$((last[$c] + 1)); fi
        last[$c]=$i
        if ((i - start + 1 > best_len)); then best_start=$start; best_len=$((i - start + 1)); fi
    done
    echo "${s:best_start:best_len}"
}

for s in abcabcbb bbbbb pwwkew dvdf; do
    r=$(longest_unique "$s")
    echo "$s $r ${#r}"
done
