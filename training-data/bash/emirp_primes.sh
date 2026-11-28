#!/usr/bin/env bash
is_prime() {
  local n=$1 i
  ((n < 2)) && return 1
  for ((i = 2; i * i <= n; i++)); do
    ((n % i == 0)) && return 1
  done
  return 0
}

out=()
for ((p = 2; p < 100; p++)); do
  r=$(rev <<<"$p")
  ((r != p)) && is_prime "$p" && is_prime "$r" && out+=("$p")
done
echo "${out[*]}"
