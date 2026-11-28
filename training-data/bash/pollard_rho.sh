#!/usr/bin/env bash
gcd() { local a=$1 b=$2 t; while ((b)); do t=$((a%b)); a=$b; b=$t; done; echo $a; }
rho() {
  local n=$1 x=2 y=2 d=1 diff
  while ((d == 1)); do
    x=$(( (x*x + 1) % n ))
    y=$(( (y*y + 1) % n )); y=$(( (y*y + 1) % n ))
    diff=$(( x > y ? x-y : y-x ))
    d=$(gcd $diff $n)
  done
  echo $d
}
f=$(rho 8051); echo "8051 = $f * $((8051/f))"
