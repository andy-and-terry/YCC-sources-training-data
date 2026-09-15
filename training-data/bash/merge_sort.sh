#!/usr/bin/env bash
set -euo pipefail

merge_sort() {
    local arr=("$@")
    local n=${#arr[@]}
    if ((n <= 1)); then
        printf '%s\n' "${arr[@]}"
        return
    fi

    local mid=$((n / 2))
    local left=("${arr[@]:0:mid}")
    local right=("${arr[@]:mid}")

    local sorted_left sorted_right
    mapfile -t sorted_left < <(merge_sort "${left[@]}")
    mapfile -t sorted_right < <(merge_sort "${right[@]}")

    local i=0 j=0
    local merged=()
    while ((i < ${#sorted_left[@]} && j < ${#sorted_right[@]})); do
        if ((sorted_left[i] <= sorted_right[j])); then
            merged+=("${sorted_left[i]}")
            i=$((i + 1))
        else
            merged+=("${sorted_right[j]}")
            j=$((j + 1))
        fi
    done
    while ((i < ${#sorted_left[@]})); do
        merged+=("${sorted_left[i]}")
        i=$((i + 1))
    done
    while ((j < ${#sorted_right[@]})); do
        merged+=("${sorted_right[j]}")
        j=$((j + 1))
    done

    printf '%s\n' "${merged[@]}"
}

numbers=(8 3 5 1 9 2 7 4 6)
mapfile -t sorted < <(merge_sort "${numbers[@]}")
echo "${sorted[@]}"
