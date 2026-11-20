#!/usr/bin/env bash
# Wilson's theorem primality test.
wilson() {
  local n=$1 f=1 i
  ((n < 2)) && return 1
  for ((i = 2; i < n; i++)); do f=$((f * i % n)); done
  ((f == n - 1))
}
for n in {2..19}; do wilson "$n" && printf '%s ' "$n"; done
echo
