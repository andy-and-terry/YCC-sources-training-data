#!/usr/bin/env bash
set -euo pipefail

declare -A last_seen=()
seq=(0)
for (( n = 0; n < 19; n++ )); do
  current=${seq[n]}
  if [[ -n ${last_seen[$current]:-} ]]; then
    next=$(( n - last_seen[$current] ))
  else
    next=0
  fi
  last_seen[$current]=$n
  seq+=("$next")
done
echo "${seq[*]}"
