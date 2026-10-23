#!/usr/bin/env bash
is_pronic() {
  local n=$1 k
  for ((k = 0; k * (k + 1) <= n; k++)); do
    ((k * (k + 1) == n)) && return 0
  done
  return 1
}

for ((n = 0; n < 100; n++)); do
  is_pronic "$n" && printf '%d ' "$n"
done
echo
