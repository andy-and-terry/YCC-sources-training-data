#!/usr/bin/env bash
set -euo pipefail

gnome_sort() {
    local -n a=$1
    local i=0 t
    while ((i < ${#a[@]})); do
        if ((i == 0 || a[i - 1] <= a[i])); then
            i=$((i + 1))
        else
            t=${a[i]}; a[i]=${a[i - 1]}; a[i - 1]=$t
            i=$((i - 1))
        fi
    done
}

data=(34 2 10 -9 7 7 0)
gnome_sort data
echo "${data[*]}"
