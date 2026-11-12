#!/usr/bin/env bash
is_even() { local n=$1; (( n % 2 == 0 )); }
for i in 1 2 3 4; do
  if is_even "$i"; then echo "$i even"; else echo "$i odd"; fi
done
