#!/usr/bin/env bash
set -euo pipefail

odd_even_sort() {
    local -n a=$1
    local sorted=0 start i t
    while ((!sorted)); do
        sorted=1
        for start in 1 0; do
            for ((i = start; i + 1 < ${#a[@]}; i += 2)); do
                if ((a[i] > a[i + 1])); then
                    t=${a[i]}; a[i]=${a[i + 1]}; a[i + 1]=$t
                    sorted=0
                fi
            done
        done
    done
}

data=(34 2 10 -9 7 7 0 15)
odd_even_sort data
echo "${data[*]}"
