#!/usr/bin/env bash
set -euo pipefail

s=(0 1)
for (( n = 2; n < 20; n++ )); do
  if (( n % 2 == 0 )); then
    s[n]=${s[n/2]}
  else
    s[n]=$(( s[(n-1)/2] + s[(n+1)/2] ))
  fi
done
echo "${s[*]}"
