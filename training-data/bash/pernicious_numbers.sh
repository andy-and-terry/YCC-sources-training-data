#!/usr/bin/env bash
# Pernicious numbers: the popcount is prime.
is_prime() {
  local n=$1 d
  ((n < 2)) && return 1
  for ((d = 2; d * d <= n; d++)); do ((n % d == 0)) && return 1; done
  return 0
}
popcount() { local n=$1 c=0; while ((n)); do ((c += n & 1, n >>= 1)); done; echo "$c"; }

out=()
for n in $(seq 1 20); do
  is_prime "$(popcount "$n")" && out+=("$n")
done
echo "${out[*]}"
