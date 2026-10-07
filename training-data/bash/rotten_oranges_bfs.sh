#!/usr/bin/env bash
set -euo pipefail

# 0 empty, 1 fresh, 2 rotten. Grid rows are strings.
oranges_rotting() {
    local g=("$@") rows=$# cols=${#1} r c fresh=0 head=0 t minutes=0 d dr dc nr nc
    local q=()
    for ((r = 0; r < rows; r++)); do
        for ((c = 0; c < cols; c++)); do
            case ${g[r]:c:1} in 2) q+=("$r $c 0") ;; 1) fresh=$((fresh + 1)) ;; esac
        done
    done
    while ((head < ${#q[@]})); do
        read -r r c t <<<"${q[head]}"; head=$((head + 1))
        minutes=$t
        for d in "1 0" "-1 0" "0 1" "0 -1"; do
            read -r dr dc <<<"$d"
            nr=$((r + dr)); nc=$((c + dc))
            ((nr < 0 || nc < 0 || nr >= rows || nc >= cols)) && continue
            [[ ${g[nr]:nc:1} == 1 ]] || continue
            g[nr]=${g[nr]:0:nc}2${g[nr]:nc+1}
            fresh=$((fresh - 1))
            q+=("$nr $nc $((t + 1))")
        done
    done
    ((fresh)) && echo -1 || echo "$minutes"
}

echo "$(oranges_rotting 211 110 011) $(oranges_rotting 211 011 101) $(oranges_rotting 02)"
