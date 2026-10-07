#!/usr/bin/env bash
set -euo pipefail

# All unique triplets summing to zero: sort, then two pointers.
three_sum() {
    local a i l r s
    mapfile -t a < <(printf '%s\n' "$@" | sort -n)
    local n=${#a[@]}
    for ((i = 0; i < n - 2; i++)); do
        ((i > 0 && a[i] == a[i - 1])) && continue
        l=$((i + 1)) r=$((n - 1))
        while ((l < r)); do
            s=$((a[i] + a[l] + a[r]))
            if ((s < 0)); then l=$((l + 1))
            elif ((s > 0)); then r=$((r - 1))
            else
                echo "[${a[i]}, ${a[l]}, ${a[r]}]"
                l=$((l + 1)); r=$((r - 1))
                while ((l < r && a[l] == a[l - 1])); do l=$((l + 1)); done
            fi
        done
    done
}

three_sum -1 0 1 2 -1 -4
echo ---
three_sum 0 0 0 0
echo ---
three_sum -2 0 1 1 2 -1 -4 3
