#!/usr/bin/env bash
# Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
a=0
b=1
out=()
for ((i = 0; i < 15; i++)); do
  out+=("$a")
  ((next = b + 2 * a))
  a=$b
  b=$next
done
echo "${out[*]}"
