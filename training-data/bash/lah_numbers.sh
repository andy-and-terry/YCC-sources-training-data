#!/usr/bin/env bash
lah() {
  local n=$1 k=$2 c=1 f=1 i
  for ((i = 0; i < k - 1; i++)); do c=$((c * (n - 1 - i) / (i + 1))); done
  for ((i = k + 1; i <= n; i++)); do f=$((f * i)); done
  echo $((c * f))
}

for n in 1 2 3 4 5; do
  row=()
  for ((k = 1; k <= n; k++)); do row+=("$(lah "$n" "$k")"); done
  echo "${row[*]}"
done
