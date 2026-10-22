#!/usr/bin/env bash
set -euo pipefail

farey() {
  local n=$1 a=0 b=1 c=1 d=$1 k t
  local out="0/1"
  while (( c <= n )); do
    out+=" $c/$d"
    k=$(( (n + b) / d ))
    t=$c; c=$(( k * c - a )); a=$t
    t=$d; d=$(( k * d - b )); b=$t
  done
  echo "$out"
}

farey 5
