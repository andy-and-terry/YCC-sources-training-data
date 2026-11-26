#!/usr/bin/env bash
# Primorials up to 1e6, including 1; expect 8.
is_prime() {
  local n=$1 d
  (( n < 2 )) && return 1
  for (( d = 2; d * d <= n; d++ )); do (( n % d == 0 )) && return 1; done
  return 0
}
values=(1)
acc=1
for (( p = 2; ; p++ )); do
  is_prime "$p" || continue
  acc=$(( acc * p ))
  (( acc > 1000000 )) && break
  values+=("$acc")
done
echo "${values[*]}"
echo "${#values[@]}"
