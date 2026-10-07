#!/usr/bin/env bash
set -euo pipefail

# Subset-sum DP: from[s] = index of the item that first reached sum s.
can_partition() {
    local nums=("$@") total=0 x i s target
    for x in "${nums[@]}"; do total=$((total + x)); done
    ((total % 2)) && { echo no; return; }
    target=$((total / 2))
    local from=([0]=-1)
    for ((i = 0; i < ${#nums[@]}; i++)); do
        for s in $(printf '%s\n' "${!from[@]}" | sort -rn); do
            ns=$((s + nums[i]))
            ((ns <= target)) && [[ -z ${from[ns]:-} ]] && from[ns]=$i
        done
    done
    [[ -n ${from[target]:-} ]] || { echo no; return; }
    local subset=()
    for ((s = target; s > 0; s -= nums[from[s]])); do subset+=("${nums[from[s]]}"); done
    echo "[${subset[*]}]"
}

for a in "1 5 11 5" "1 2 3 5" "3 1 1 2 2 1"; do
    # shellcheck disable=SC2086
    echo "[$a] -> $(can_partition $a)"
done
