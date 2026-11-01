#!/usr/bin/env bash
declare -A stock=([apple]=3 [pear]=0 [fig]=12)
stock[kiwi]=7
for k in "${!stock[@]}"; do
  printf '%s=%d\n' "$k" "${stock[$k]}"
done | sort
echo "count: ${#stock[@]}"
[[ -v stock[pear] ]] && echo "pear tracked"
