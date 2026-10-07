#!/usr/bin/env bash
set -euo pipefail

# Three-way partition around a pivot value.
partition3() {
    local pivot=$1
    local -n a=$2
    local lo=0 mid=0 hi=$((${#a[@]} - 1)) t
    while ((mid <= hi)); do
        if ((a[mid] < pivot)); then
            t=${a[lo]}; a[lo]=${a[mid]}; a[mid]=$t
            lo=$((lo + 1)); mid=$((mid + 1))
        elif ((a[mid] > pivot)); then
            t=${a[hi]}; a[hi]=${a[mid]}; a[mid]=$t
            hi=$((hi - 1))
        else
            mid=$((mid + 1))
        fi
    done
    echo "equal region $lo..$hi"
}

colors=(2 0 2 1 1 0 2 0 1)
partition3 1 colors
echo "${colors[*]}"
nums=(9 5 1 7 5 3 8 2)
partition3 5 nums >/dev/null
echo "${nums[*]}"
