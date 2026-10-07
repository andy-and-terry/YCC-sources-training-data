#!/usr/bin/env bash
set -euo pipefail

aliquot_sum() {
  local n=$1 sum=1 i
  ((n == 1)) && { echo 0; return; }
  for ((i = 2; i * i <= n; i++)); do
    if ((n % i == 0)); then
      ((sum += i))
      ((i != n / i)) && ((sum += n / i))
    fi
  done
  echo "$sum"
}

classify() {
  local s
  s=$(aliquot_sum "$1")
  if ((s == $1)); then echo perfect
  elif ((s > $1)); then echo abundant
  else echo deficient
  fi
}

for n in 6 12 28 13 8128; do echo "$n $(classify "$n")"; done
