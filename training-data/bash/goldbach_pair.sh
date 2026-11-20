#!/usr/bin/env bash
# Goldbach pair for an even number.
is_prime() {
  local n=$1 d
  ((n < 2)) && return 1
  for ((d = 2; d * d <= n; d++)); do ((n % d == 0)) && return 1; done
  return 0
}
n=28
for ((p = 2; p <= n / 2; p++)); do
  if is_prime "$p" && is_prime $((n - p)); then echo "$p + $((n - p))"; break; fi
done
