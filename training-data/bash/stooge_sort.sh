#!/usr/bin/env bash
set -euo pipefail

stooge_sort() {
    local lo=$1 hi=$2 t tmp
    if ((arr[lo] > arr[hi])); then
        tmp=${arr[lo]}; arr[lo]=${arr[hi]}; arr[hi]=$tmp
    fi
    if ((hi - lo + 1 > 2)); then
        t=$(((hi - lo + 1) / 3))
        stooge_sort "$lo" $((hi - t))
        stooge_sort $((lo + t)) "$hi"
        stooge_sort "$lo" $((hi - t))
    fi
}

arr=(5 -2 9 0 3 3 8 1)
stooge_sort 0 $((${#arr[@]} - 1))
echo "${arr[*]}"
