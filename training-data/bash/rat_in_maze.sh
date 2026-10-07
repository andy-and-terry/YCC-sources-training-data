#!/usr/bin/env bash
set -euo pipefail

maze=(
    '1000'
    '1101'
    '1100'
    '0111'
)
n=${#maze[@]}
declare -A seen=()
paths=()

dfs() {
    local r=$1 c=$2 path=$3 move dr dc nr nc
    if ((r == n - 1 && c == n - 1)); then paths+=("$path"); return; fi
    seen["$r,$c"]=1
    for move in "D 1 0" "L 0 -1" "R 0 1" "U -1 0"; do
        read -r d dr dc <<<"$move"
        nr=$((r + dr)); nc=$((c + dc))
        ((nr < 0 || nc < 0 || nr >= n || nc >= n)) && continue
        [[ ${maze[nr]:nc:1} == 1 && -z ${seen["$nr,$nc"]:-} ]] && dfs "$nr" "$nc" "$path$d"
    done
    unset 'seen[$r,$c]'
}

[[ ${maze[0]:0:1} == 1 ]] && dfs 0 0 ''
echo "${paths[*]}"
