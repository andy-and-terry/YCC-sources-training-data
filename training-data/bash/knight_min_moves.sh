#!/usr/bin/env bash
set -euo pipefail

# Squares are numbered 0..63 (file + 8 * rank). BFS records each square's parent.
sq() { local f=${1:0:1} r=${1:1:1}; echo $(($(printf '%d' "'$f") - 97 + 8 * (r - 1))); }
name() { printf "\\x$(printf '%x' $((97 + $1 % 8)))%d" $(($1 / 8 + 1)); }

knight_path() {
    local start goal q head=0 cur x y nx ny nxt d dx dy path=()
    start=$(sq "$1"); goal=$(sq "$2")
    local -A prev=([$start]=-1)
    q=("$start")
    while ((head < ${#q[@]})); do
        cur=${q[head]}; head=$((head + 1))
        ((cur == goal)) && break
        x=$((cur % 8)); y=$((cur / 8))
        for d in "1 2" "2 1" "-1 2" "-2 1" "1 -2" "2 -1" "-1 -2" "-2 -1"; do
            read -r dx dy <<<"$d"
            nx=$((x + dx)); ny=$((y + dy))
            ((nx < 0 || ny < 0 || nx > 7 || ny > 7)) && continue
            nxt=$((nx + 8 * ny))
            [[ -n ${prev[$nxt]:-} ]] && continue
            prev[$nxt]=$cur
            q+=("$nxt")
        done
    done
    for ((cur = goal; cur != -1; cur = prev[$cur])); do path=("$(name "$cur")" "${path[@]}"); done
    echo "$1 -> $2: $((${#path[@]} - 1)) moves (${path[*]})"
}

knight_path a1 b2
knight_path a1 h8
knight_path d4 d4
knight_path b1 c3
