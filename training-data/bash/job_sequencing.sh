#!/usr/bin/env bash
set -euo pipefail

# Unit-time jobs "id deadline profit": greedy by profit, each placed in the latest free slot.
jobs=$'a 2 100\nb 1 19\nc 2 27\nd 1 25\ne 3 15'
slots=() profit=0

while read -r id deadline p; do
    for ((s = deadline; s >= 1; s--)); do
        if [[ -z ${slots[s]:-} ]]; then slots[s]=$id; profit=$((profit + p)); break; fi
    done
done < <(sort -k3,3nr <<<"$jobs")

echo "profit $profit, order: ${slots[*]}"
