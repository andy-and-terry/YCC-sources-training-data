#!/usr/bin/env bash
set -euo pipefail

a="ABCBDAB"
b="BDCABA"
la=${#a}
lb=${#b}

declare -A dp

for ((i = 0; i <= la; i++)); do
    dp["$i,0"]=0
done
for ((j = 0; j <= lb; j++)); do
    dp["0,$j"]=0
done

for ((i = 1; i <= la; i++)); do
    for ((j = 1; j <= lb; j++)); do
        key="$i,$j"
        diag="$((i - 1)),$((j - 1))"
        up="$((i - 1)),$j"
        left="$i,$((j - 1))"
        if [[ ${a:i-1:1} == ${b:j-1:1} ]]; then
            diag_val=${dp[$diag]}
            dp[$key]=$((diag_val + 1))
        else
            up_val=${dp[$up]}
            left_val=${dp[$left]}
            dp[$key]=$((up_val > left_val ? up_val : left_val))
        fi
    done
done

echo "${dp[$la,$lb]}"
