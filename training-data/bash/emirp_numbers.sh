#!/bin/bash
is_prime() {
    local n=$1
    (( n < 2 )) && return 1
    for ((i = 2; i * i <= n; i++)); do
        (( n % i == 0 )) && return 1
    done
    return 0
}

for ((p = 2; p < 200; p++)); do
    r=$(echo "$p" | rev)
    r=$((10#$r))
    if (( r != p )) && is_prime "$p" && is_prime "$r"; then
        printf '%s ' "$p"
    fi
done
echo # 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
