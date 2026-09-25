#!/usr/bin/env bash
set -euo pipefail

convert() {
  local v=$1 from=$2 to=$3
  awk -v v="$v" -v f="$from" -v t="$to" 'BEGIN {
    if (f == "F") c = (v - 32) * 5 / 9; else if (f == "K") c = v - 273.15; else c = v
    if (t == "F") r = c * 9 / 5 + 32; else if (t == "K") r = c + 273.15; else r = c
    printf "%.2f\n", r
  }'
}

convert 100 C F
convert 212 F K
convert 0 K C
