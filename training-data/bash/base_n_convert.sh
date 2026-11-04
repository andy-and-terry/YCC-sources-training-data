#!/usr/bin/env bash
to_base() {
  local n=$1 base=$2 out="" digits=0123456789abcdefghijklmnopqrstuvwxyz
  ((n == 0)) && { echo 0; return; }
  while ((n > 0)); do
    out="${digits:n % base:1}$out"
    ((n /= base))
  done
  echo "$out"
}

for b in 2 8 16 36; do echo "255 in base $b = $(to_base 255 "$b")"; done
echo $((16#ff)) $((2#1010)) $((36#zz))
