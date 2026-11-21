#!/usr/bin/env bash
# Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
gcd() { local a=$1 b=$2 t; while ((b)); do t=$((a % b)); a=$b; b=$t; done; echo "$a"; }

pow_mod() {
  local b=$(($1 % $3)) e=$2 m=$3 r=1
  while ((e > 0)); do
    ((e & 1)) && r=$((r * b % m))
    b=$((b * b % m))
    ((e >>= 1))
  done
  echo "$r"
}

is_prime() {
  local n=$1 p
  for ((p = 2; p * p <= n; p++)); do ((n % p == 0)) && return 1; done
  return 0
}

is_carmichael() {
  local n=$1 a
  is_prime "$n" && return 1
  for ((a = 2; a < n; a++)); do
    if (($(gcd "$a" "$n") == 1)) && (($(pow_mod "$a" $((n - 1)) "$n") != 1)); then
      return 1
    fi
  done
  return 0
}

out=()
for ((n = 3; n < 3000; n += 2)); do
  is_carmichael "$n" && out+=("$n")
done
echo "${out[*]}"
