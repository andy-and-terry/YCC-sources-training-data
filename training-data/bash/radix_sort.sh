#!/usr/bin/env bash
set -euo pipefail

radix_sort() {
    local -n arr=$1
    local n=${#arr[@]}
    if ((n == 0)); then
        return
    fi

    local max=${arr[0]}
    local val
    for val in "${arr[@]}"; do
        if ((val > max)); then
            max=$val
        fi
    done

    local exp=1
    while ((max / exp > 0)); do
        local -a output
        local -a buckets
        local i digit
        for ((i = 0; i < 10; i++)); do
            buckets[i]=0
        done
        for val in "${arr[@]}"; do
            digit=$(((val / exp) % 10))
            buckets[digit]=$((buckets[digit] + 1))
        done
        for ((i = 1; i < 10; i++)); do
            buckets[i]=$((buckets[i] + buckets[i - 1]))
        done
        for ((i = n - 1; i >= 0; i--)); do
            val=${arr[i]}
            digit=$(((val / exp) % 10))
            buckets[digit]=$((buckets[digit] - 1))
            output[buckets[digit]]=$val
        done
        for ((i = 0; i < n; i++)); do
            arr[i]=${output[i]}
        done
        exp=$((exp * 10))
    done
}

numbers=(170 45 75 90 802 24 2 66)
radix_sort numbers
echo "${numbers[@]}"
