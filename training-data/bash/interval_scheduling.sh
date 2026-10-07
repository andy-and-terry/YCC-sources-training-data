#!/usr/bin/env bash
set -euo pipefail

intervals=$'1 4\n3 5\n0 6\n5 7\n3 9\n5 9\n6 10\n8 11\n8 12\n2 14\n12 16'

# Greedy by earliest finish time.
chosen=() end=-1
while read -r s e; do
    ((s >= end)) || continue
    chosen+=("[$s,$e]")
    end=$e
done < <(sort -k2,2n <<<"$intervals")
echo "chosen: ${chosen[*]}"

# Sweep line: +1 at each start, -1 at each end; ends sort before starts at equal times.
rooms=$(awk '{ print $1, 1; print $2, -1 }' <<<"$intervals" | sort -k1,1n -k2,2n |
    awk '{ cur += $2; if (cur > best) best = cur } END { print best }')
echo "rooms needed: $rooms"
