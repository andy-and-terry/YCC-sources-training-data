#!/usr/bin/env bash
set -euo pipefail

comb_sort() {
    local -n a=$1
    local n=${#a[@]} gap=${#a[@]} sorted=0 i t
    while ((!sorted)); do
        gap=$((gap * 10 / 13))
        if ((gap <= 1)); then gap=1; sorted=1; fi
        for ((i = 0; i + gap < n; i++)); do
            if ((a[i] > a[i + gap])); then
                t=${a[i]}; a[i]=${a[i + gap]}; a[i + gap]=$t
                sorted=0
            fi
        done
    done
}

data=(8 4 1 56 3 -44 23 -6 28 0)
comb_sort data
echo "${data[*]}"
