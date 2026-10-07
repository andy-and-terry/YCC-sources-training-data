#!/usr/bin/env bash
set -euo pipefail

digit_sum() { local s=$1 t=0 i; for ((i = 0; i < ${#s}; i++)); do t=$((t + ${s:i:1})); done; echo "$t"; }

digital_root_loop() {
    local n=$1 p=0
    while ((${#n} > 1)); do n=$(digit_sum "$n"); p=$((p + 1)); done
    echo "$n $p"
}

digital_root() { (($1 == 0)) && echo 0 || echo $((1 + ($1 - 1) % 9)); }

for n in 0 16 942 132189 493193 999999999999; do
    read -r r p <<<"$(digital_root_loop "$n")"
    printf '%-13s root=%d formula=%d persistence=%d\n' "$n" "$r" "$(digital_root "$n")" "$p"
done
