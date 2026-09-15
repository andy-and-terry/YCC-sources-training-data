#!/usr/bin/env bash
set -euo pipefail

coin_change() {
    local -a coins=("${!1}")
    local amount=$2
    local -a dp
    local i c

    dp[0]=0
    for ((i = 1; i <= amount; i++)); do
        dp[i]=999999
    done

    for ((i = 1; i <= amount; i++)); do
        for c in "${coins[@]}"; do
            if ((c <= i && dp[i - c] + 1 < dp[i])); then
                dp[i]=$((dp[i - c] + 1))
            fi
        done
    done

    if ((dp[amount] >= 999999)); then
        echo "-1"
    else
        echo "${dp[amount]}"
    fi
}

coins=(1 5 10 25)
coin_change coins[@] 63
coin_change coins[@] 11
