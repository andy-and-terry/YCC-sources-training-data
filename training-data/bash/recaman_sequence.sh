#!/usr/bin/env bash
set -euo pipefail

declare -A seen=([0]=1)
seq=(0)
for (( n = 1; n < 20; n++ )); do
  next=$(( seq[n-1] - n ))
  if (( next <= 0 )) || [[ -n ${seen[$next]:-} ]]; then
    next=$(( seq[n-1] + n ))
  fi
  seen[$next]=1
  seq+=("$next")
done
echo "${seq[*]}"
