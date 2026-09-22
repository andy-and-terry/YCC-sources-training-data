#!/usr/bin/env bash
set -euo pipefail

edit_distance() {
    local s1=$1 s2=$2
    local m=${#s1} n=${#s2}
    local -a dp
    for ((i = 0; i <= m; i++)); do
        for ((j = 0; j <= n; j++)); do
            if ((i == 0)); then
                dp[i * (n + 1) + j]=$j
            elif ((j == 0)); then
                dp[i * (n + 1) + j]=$i
            elif [[ ${s1:i-1:1} == "${s2:j-1:1}" ]]; then
                dp[i * (n + 1) + j]=${dp[(i - 1) * (n + 1) + j - 1]}
            else
                local del=${dp[(i - 1) * (n + 1) + j]}
                local ins=${dp[i * (n + 1) + j - 1]}
                local sub=${dp[(i - 1) * (n + 1) + j - 1]}
                local min=$del
                ((ins < min)) && min=$ins
                ((sub < min)) && min=$sub
                dp[i * (n + 1) + j]=$((min + 1))
            fi
        done
    done
    echo "${dp[m * (n + 1) + n]}"
}

edit_distance "kitten" "sitting"
edit_distance "flaw" "lawn"
