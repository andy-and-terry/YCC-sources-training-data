#!/usr/bin/env bash
is_prime() {
  local n=$1 i
  (( n < 2 )) && return 1
  for (( i = 2; i * i <= n; i++ )); do (( n % i == 0 )) && return 1; done
  return 0
}
found=()
for (( p = 2; ${#found[@]} < 10; p++ )); do
  if is_prime "$p" && is_prime $(( 2 * p + 1 )); then found+=("$p"); fi
done
echo "${found[*]}" # 2 3 5 11 23 29 41 53 83 89
