#!/usr/bin/env bash
set -euo pipefail

# Can the word be traced through horizontally/vertically adjacent cells, each used once?
board=(ABCE SFCS ADEE)
rows=${#board[@]} cols=${#board[0]}
declare -A used=()

dfs() {
    local r=$1 c=$2 word=$3 i=$4 d dr dc
    ((i == ${#word})) && return 0
    ((r < 0 || c < 0 || r >= rows || c >= cols)) && return 1
    [[ -n ${used["$r,$c"]:-} || ${board[r]:c:1} != "${word:i:1}" ]] && return 1
    used["$r,$c"]=1
    for d in "1 0" "-1 0" "0 1" "0 -1"; do
        read -r dr dc <<<"$d"
        if dfs $((r + dr)) $((c + dc)) "$word" $((i + 1)); then unset 'used[$r,$c]'; return 0; fi
    done
    unset 'used[$r,$c]'
    return 1
}

exists() {
    local r c
    for ((r = 0; r < rows; r++)); do
        for ((c = 0; c < cols; c++)); do dfs "$r" "$c" "$1" 0 && return 0; done
    done
    return 1
}

printf '%s\n' "${board[@]}"
for w in ABCCED SEE ABCB ADFBCCE; do
    if exists "$w"; then echo "$w: found"; else echo "$w: not found"; fi
done
