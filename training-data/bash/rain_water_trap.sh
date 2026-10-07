#!/usr/bin/env bash
set -euo pipefail

trap_water() {
    local h=("$@") l=0 r=$(($# - 1)) lmax=0 rmax=0 water=0
    while ((l < r)); do
        if ((h[l] < h[r])); then
            ((h[l] > lmax)) && lmax=${h[l]}
            water=$((water + lmax - h[l])); l=$((l + 1))
        else
            ((h[r] > rmax)) && rmax=${h[r]}
            water=$((water + rmax - h[r])); r=$((r - 1))
        fi
    done
    echo "$water"
}

for h in "0 1 0 2 1 0 1 3 2 1 2 1" "4 2 0 3 2 5" "1 2 3"; do
    # shellcheck disable=SC2086
    echo "[$h] -> $(trap_water $h)"
done
