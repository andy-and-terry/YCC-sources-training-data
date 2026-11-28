#!/bin/bash
is_armstrong() {
    local n=$1 len=${#1} sum=0 d
    for ((i = 0; i < len; i++)); do
        d=${n:i:1}
        sum=$((sum + d ** len))
    done
    [ "$sum" -eq "$n" ]
}

for ((n = 1; n < 1000; n++)); do
    is_armstrong "$n" && printf '%s ' "$n"
done
echo # 1..9 153 370 371 407
