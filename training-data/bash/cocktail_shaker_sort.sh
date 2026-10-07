#!/usr/bin/env bash
set -euo pipefail

cocktail_sort() {
    local -n a=$1
    local lo=0 hi=$((${#a[@]} - 1)) last i t
    while ((lo < hi)); do
        last=$lo
        for ((i = lo; i < hi; i++)); do
            if ((a[i] > a[i + 1])); then t=${a[i]}; a[i]=${a[i + 1]}; a[i + 1]=$t; last=$i; fi
        done
        hi=$last
        for ((i = hi; i > lo; i--)); do
            if ((a[i - 1] > a[i])); then t=${a[i]}; a[i]=${a[i - 1]}; a[i - 1]=$t; last=$i; fi
        done
        lo=$last
    done
}

data=(5 1 4 2 8 0 2 -3 9)
cocktail_sort data
echo "${data[*]}"
