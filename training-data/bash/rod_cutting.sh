#!/usr/bin/env bash
set -euo pipefail

rod_cutting() {
    local -a prices=("${!1}")
    local n=$2
    local -a dp
    local len cut best candidate

    dp[0]=0
    for ((len = 1; len <= n; len++)); do
        best=-999999
        for ((cut = 1; cut <= len; cut++)); do
            candidate=$((prices[cut - 1] + dp[len - cut]))
            if ((candidate > best)); then
                best=$candidate
            fi
        done
        dp[len]=$best
    done

    echo "${dp[n]}"
}

prices=(1 5 8 9 10 17 17 20)
rod_cutting prices[@] 8
rod_cutting prices[@] 4
