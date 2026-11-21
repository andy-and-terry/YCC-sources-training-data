#!/usr/bin/env bash
# Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
gcd() { local a=$1 b=$2 t; while ((b)); do t=$((a % b)); a=$b; b=$t; done; echo "$a"; }

phi() {
  local n=$1 c=0 k g a b t
  for ((k = 1; k <= n; k++)); do
    a=$k; b=$n
    while ((b)); do t=$((a % b)); a=$b; b=$t; done
    ((a == 1)) && ((c++))
  done
  echo "$c"
}

is_perfect_totient() {
  local n=$1 total=0 m=$1
  while ((m > 1)); do
    m=$(phi "$m")
    ((total += m))
  done
  ((total == n))
}

out=()
for ((n = 2; n < 200; n++)); do
  is_perfect_totient "$n" && out+=("$n")
done
echo "${out[*]}"
