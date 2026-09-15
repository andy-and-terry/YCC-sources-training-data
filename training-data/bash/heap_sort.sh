#!/usr/bin/env bash
set -euo pipefail

heapify() {
    local -n arr=$1
    local n=$2
    local root=$3
    local largest=$root
    local left=$((2 * root + 1))
    local right=$((2 * root + 2))

    if ((left < n && arr[left] > arr[largest])); then
        largest=$left
    fi
    if ((right < n && arr[right] > arr[largest])); then
        largest=$right
    fi
    if ((largest != root)); then
        local temp=${arr[root]}
        arr[root]=${arr[largest]}
        arr[largest]=$temp
        heapify "$1" "$n" "$largest"
    fi
}

heap_sort() {
    local -n arr=$1
    local n=${#arr[@]}
    local i

    for ((i = n / 2 - 1; i >= 0; i--)); do
        heapify "$1" "$n" "$i"
    done

    for ((i = n - 1; i > 0; i--)); do
        local temp=${arr[0]}
        arr[0]=${arr[i]}
        arr[i]=$temp
        heapify "$1" "$i" 0
    done
}

numbers=(5 2 9 1 5 6 3)
heap_sort numbers
echo "${numbers[@]}"
