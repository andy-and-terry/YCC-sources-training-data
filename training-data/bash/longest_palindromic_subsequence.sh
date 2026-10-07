#!/usr/bin/env bash
set -euo pipefail

# dp is a flat array: dp[i * n + j] = LPS length of s[i..j].
lps() {
    local s=$1 n=${#1} i j inner l='' r=''
    ((n == 0)) && { echo ''; return; }
    local dp=()
    for ((i = n - 1; i >= 0; i--)); do
        dp[i * n + i]=1
        for ((j = i + 1; j < n; j++)); do
            if [[ ${s:i:1} == "${s:j:1}" ]]; then
                inner=0; ((i + 1 <= j - 1)) && inner=${dp[(i + 1) * n + j - 1]}
                dp[i * n + j]=$((inner + 2))
            else
                a=${dp[(i + 1) * n + j]} b=${dp[i * n + j - 1]}
                dp[i * n + j]=$((a > b ? a : b))
            fi
        done
    done
    i=0 j=$((n - 1))
    while ((i <= j)); do
        if ((i == j)); then l+=${s:i:1}; break; fi
        if [[ ${s:i:1} == "${s:j:1}" ]]; then
            l+=${s:i:1}; r=${s:j:1}$r; i=$((i + 1)); j=$((j - 1))
        elif ((dp[(i + 1) * n + j] >= dp[i * n + j - 1])); then
            i=$((i + 1))
        else
            j=$((j - 1))
        fi
    done
    echo "$l$r"
}

for s in bbbab character agbdba cbbd; do echo "$s -> $(lps "$s")"; done
