#!/usr/bin/env bash
set -euo pipefail

quickselect() {
    local -n arr=$1
    local left=$2 right=$3 k=$4
    local pivot i store_index tmp

    if ((left == right)); then
        echo "${arr[left]}"
        return
    fi

    pivot=${arr[right]}
    store_index=$left
    for ((i = left; i < right; i++)); do
        if ((arr[i] < pivot)); then
            tmp=${arr[store_index]}
            arr[store_index]=${arr[i]}
            arr[i]=$tmp
            store_index=$((store_index + 1))
        fi
    done
    tmp=${arr[store_index]}
    arr[store_index]=${arr[right]}
    arr[right]=$tmp

    if ((k == store_index)); then
        echo "${arr[k]}"
    elif ((k < store_index)); then
        quickselect "$1" "$left" "$((store_index - 1))" "$k"
    else
        quickselect "$1" "$((store_index + 1))" "$right" "$k"
    fi
}

numbers=(7 2 9 4 1 8 3)
k=2
quickselect numbers 0 $((${#numbers[@]} - 1)) "$k"
