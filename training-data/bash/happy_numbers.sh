#!/bin/bash
is_happy() {
    local n=$1 s d
    declare -A seen
    while [ "$n" -ne 1 ] && [ -z "${seen[$n]}" ]; do
        seen[$n]=1
        s=0
        for ((i = 0; i < ${#n}; i++)); do
            d=${n:i:1}
            s=$((s + d * d))
        done
        n=$s
    done
    [ "$n" -eq 1 ]
}

found=()
for ((n = 1; ${#found[@]} < 8; n++)); do
    is_happy "$n" && found+=("$n")
done
echo "${found[*]}" # 1 7 10 13 19 23 28 31
