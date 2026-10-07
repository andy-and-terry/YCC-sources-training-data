#!/usr/bin/env bash
set -euo pipefail

binary_insertion_sort() {
    local -n a=$1
    local i j x lo hi mid
    for ((i = 1; i < ${#a[@]}; i++)); do
        x=${a[i]}; lo=0; hi=$i
        while ((lo < hi)); do
            mid=$(((lo + hi) / 2))
            if ((a[mid] <= x)); then lo=$((mid + 1)); else hi=$mid; fi
        done
        for ((j = i; j > lo; j--)); do a[j]=${a[j - 1]}; done
        a[lo]=$x
    done
}

data=(37 23 0 17 12 72 31 46 100 88 54)
binary_insertion_sort data
echo "${data[*]}"
