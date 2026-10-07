#!/usr/bin/env bash
set -euo pipefail

move_zeroes() {
    local -n a=$1
    local w=0 x i
    for x in "${a[@]}"; do ((x != 0)) && { a[w]=$x; w=$((w + 1)); }; done
    for ((i = w; i < ${#a[@]}; i++)); do a[i]=0; done
}

nums=(0 1 0 3 12 0 7)
move_zeroes nums
echo "${nums[*]}"

# A filter-based alternative using grep.
printf '%s\n' 0 1 0 3 12 | { grep -vx 0; printf '%s\n' 0 0; } | paste -sd' '
