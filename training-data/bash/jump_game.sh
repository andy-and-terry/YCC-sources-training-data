#!/usr/bin/env bash
set -euo pipefail

can_jump() {
    local a=("$@") reach=0 i
    for ((i = 0; i < ${#a[@]}; i++)); do
        ((i > reach)) && { echo 0; return; }
        ((i + a[i] > reach)) && reach=$((i + a[i]))
    done
    echo 1
}

min_jumps() {
    local a=("$@") jumps=0 end=0 far=0 i
    for ((i = 0; i < ${#a[@]} - 1; i++)); do
        ((i + a[i] > far)) && far=$((i + a[i]))
        if ((i == end)); then
            ((far <= i)) && { echo -1; return; }
            jumps=$((jumps + 1)); end=$far
        fi
    done
    echo "$jumps"
}

for a in "2 3 1 1 4" "3 2 1 0 4" "2 3 0 1 4" "0"; do
    printf '%-10s can=%d min=%d\n' "$a" "$(can_jump $a)" "$(min_jumps $a)"
done
