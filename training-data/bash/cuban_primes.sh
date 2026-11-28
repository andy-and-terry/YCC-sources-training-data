#!/usr/bin/env bash
is_prime() {
  local n=$1 i
  ((n < 2)) && return 1
  for ((i = 2; i * i <= n; i++)); do
    ((n % i == 0)) && return 1
  done
  return 0
}

found=0
for ((y = 1; found < 8; y++)); do
  p=$((3 * y * y + 3 * y + 1))
  if is_prime "$p"; then
    printf '%d ' "$p"
    ((found++))
  fi
done
echo
