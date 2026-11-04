#!/usr/bin/env bash
gcd() {
  local a=$1 b=$2 t
  while ((b != 0)); do t=$((a % b)); a=$b; b=$t; done
  echo "${a#-}"
}

gcd_all() {
  local g=0 n
  for n in "$@"; do g=$(gcd "$g" "$n"); done
  echo "$g"
}

gcd_all 12 18 24
gcd_all 7 13
