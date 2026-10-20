#!/usr/bin/env bash
# Functions return status via `return`, data via stdout; use `local` to avoid leaks.
is_even() { (( $1 % 2 == 0 )); }

join_by() {
  local sep=$1 out=$2
  shift 2
  for item in "$@"; do out+="$sep$item"; done
  printf '%s' "$out"
}

for n in 3 4; do
  if is_even "$n"; then echo "$n even"; else echo "$n odd"; fi
done
result=$(join_by , a b c)
echo "$result"
