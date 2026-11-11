#!/usr/bin/env bash
# Fermat primality test; Carmichael number 561 fools it.
powmod() {
  local b=$(( $1 % $3 )) e=$2 m=$3 r=1
  while (( e > 0 )); do
    (( e & 1 )) && r=$(( r * b % m ))
    b=$(( b * b % m ))
    e=$(( e >> 1 ))
  done
  echo "$r"
}

probably_prime() {
  (( $1 > 2 )) && [[ $(powmod 2 $(( $1 - 1 )) "$1") -eq 1 ]]
}

for n in 97 91 561; do
  if probably_prime "$n"; then echo "$n true"; else echo "$n false"; fi
done
