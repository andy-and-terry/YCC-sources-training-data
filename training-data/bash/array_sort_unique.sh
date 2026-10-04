#!/usr/bin/env bash
# Sort and de-duplicate a bash array using sort and mapfile.
items=(pear apple fig apple banana fig kiwi)
mapfile -t sorted < <(printf '%s\n' "${items[@]}" | sort -u)
echo "unique sorted: ${sorted[*]}"
mapfile -t by_len < <(printf '%s\n' "${sorted[@]}" | awk '{print length($0), $0}' | sort -n | cut -d' ' -f2)
echo "by length: ${by_len[*]}"
echo "count: ${#sorted[@]}"
