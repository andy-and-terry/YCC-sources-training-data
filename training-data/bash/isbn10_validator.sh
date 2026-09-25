#!/usr/bin/env bash
set -euo pipefail

is_valid_isbn10() {
  local s=${1//-/} total=0 i c v
  [[ $s =~ ^[0-9]{9}[0-9X]$ ]] || return 1
  for ((i = 0; i < 10; i++)); do
    c=${s:i:1}
    [[ $c == X ]] && v=10 || v=$c
    ((total += v * (10 - i)))
  done
  ((total % 11 == 0))
}

for s in 3-598-21508-8 3-598-21507-X 3-598-21508-9; do
  is_valid_isbn10 "$s" && echo "$s valid" || echo "$s invalid"
done
