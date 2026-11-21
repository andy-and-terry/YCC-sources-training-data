#!/usr/bin/env bash
# Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
is_munchausen() {
  local n=$1 sum=0 i d
  for ((i = 0; i < ${#n}; i++)); do
    d=${n:i:1}
    ((d > 0)) && ((sum += d ** d))
  done
  ((sum == n))
}

out=()
for ((n = 1; n < 5000; n++)); do
  is_munchausen "$n" && out+=("$n")
done
echo "${out[*]}"
