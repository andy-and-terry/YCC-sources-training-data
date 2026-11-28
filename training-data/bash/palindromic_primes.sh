#!/bin/bash
is_prime() {
    local n=$1
    (( n < 2 )) && return 1
    for ((i = 2; i * i <= n; i++)); do
        (( n % i == 0 )) && return 1
    done
    return 0
}

for ((n = 2; n < 200; n++)); do
    if [ "$n" = "$(echo "$n" | rev)" ] && is_prime "$n"; then
        printf '%s ' "$n"
    fi
done
echo # 2 3 5 7 11 101 131 151 181 191
