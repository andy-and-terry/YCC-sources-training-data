#!/usr/bin/env bash
set -euo pipefail

# Simplified Timsort: insertion-sort fixed-size runs, then merge runs bottom-up.
RUN=4

insertion_sort_range() {
    local lo=$1 hi=$2 i j key
    for ((i = lo + 1; i <= hi; i++)); do
        key=${A[i]} j=$((i - 1))
        while ((j >= lo && A[j] > key)); do A[j + 1]=${A[j]}; j=$((j - 1)); done
        A[j + 1]=$key
    done
}

merge() {
    local lo=$1 mid=$2 hi=$3 i j k=$1
    local left=("${A[@]:lo:mid - lo + 1}") right=("${A[@]:mid + 1:hi - mid}")
    i=0 j=0
    while ((i < ${#left[@]} && j < ${#right[@]})); do
        if ((left[i] <= right[j])); then A[k]=${left[i]}; i=$((i + 1)); else A[k]=${right[j]}; j=$((j + 1)); fi
        k=$((k + 1))
    done
    while ((i < ${#left[@]})); do A[k]=${left[i]}; i=$((i + 1)); k=$((k + 1)); done
    while ((j < ${#right[@]})); do A[k]=${right[j]}; j=$((j + 1)); k=$((k + 1)); done
}

tim_sort() {
    local n=${#A[@]} lo size mid hi
    for ((lo = 0; lo < n; lo += RUN)); do
        hi=$((lo + RUN - 1)); ((hi >= n)) && hi=$((n - 1))
        insertion_sort_range "$lo" "$hi"
    done
    for ((size = RUN; size < n; size *= 2)); do
        for ((lo = 0; lo < n; lo += 2 * size)); do
            mid=$((lo + size - 1)); hi=$((lo + 2 * size - 1))
            ((hi >= n)) && hi=$((n - 1))
            ((mid < hi)) && merge "$lo" "$mid" "$hi"
        done
    done
    return 0
}

A=(5 21 7 23 19 -3 0 12 8 8 1 42 -7 15 3)
echo "before: ${A[*]}"
tim_sort
echo "after:  ${A[*]}"
