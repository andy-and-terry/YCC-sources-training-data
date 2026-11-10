#!/usr/bin/env bash
is_prime() {
  local n=$1 i
  (( n < 2 )) && return 1
  for (( i = 2; i * i <= n; i++ )); do (( n % i == 0 )) && return 1; done
  return 0
}
out=()
for (( n = 2; ${#out[@]} < 10; n++ )); do
  r=$(echo "$n" | rev)
  r=$((10#$r))
  if (( r != n )) && is_prime "$n" && is_prime "$r"; then out+=("$n"); fi
done
echo "${out[*]}" # 13 17 31 37 71 73 79 97 107 113
