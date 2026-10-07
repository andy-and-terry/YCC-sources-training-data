#!/usr/bin/env bash
set -euo pipefail

min_window() {
    local s=$1 t=$2 missing=${#2} l=0 r i c best_l=0 best_len=-1
    local -A need=()
    for ((i = 0; i < ${#t}; i++)); do c=${t:i:1}; need[$c]=$((${need[$c]:-0} + 1)); done
    for ((r = 0; r < ${#s}; r++)); do
        c=${s:r:1}
        ((${need[$c]:-0} > 0)) && missing=$((missing - 1))
        need[$c]=$((${need[$c]:-0} - 1))
        while ((missing == 0)); do
            if ((best_len < 0 || r - l + 1 < best_len)); then best_l=$l; best_len=$((r - l + 1)); fi
            c=${s:l:1}; l=$((l + 1))
            need[$c]=$((need[$c] + 1))
            ((need[$c] > 0)) && missing=$((missing + 1))
        done
    done
    ((best_len < 0)) && { echo ''; return; }
    echo "${s:best_l:best_len}"
}

echo "'$(min_window ADOBECODEBANC ABC)' '$(min_window a aa)' '$(min_window aa aa)'"
