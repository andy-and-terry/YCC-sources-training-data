#!/usr/bin/env bash
set -euo pipefail

luhn_valid() {
  local s=${1// /} sum=0 i d
  [[ ${#s} -ge 2 && $s =~ ^[0-9]+$ ]] || return 1
  for ((i = 0; i < ${#s}; i++)); do
    d=${s:${#s}-1-i:1}
    if ((i % 2 == 1)); then
      ((d *= 2, d > 9 && (d -= 9))) || true
    fi
    ((sum += d))
  done
  ((sum % 10 == 0))
}

for n in "4539 3195 0343 6467" "8273 1232 7352 0569"; do
  if luhn_valid "$n"; then echo "$n valid"; else echo "$n invalid"; fi
done
