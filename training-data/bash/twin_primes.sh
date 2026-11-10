#!/usr/bin/env bash
limit=80
declare -a composite
for (( i = 2; i * i <= limit; i++ )); do
  if [[ -z ${composite[i]} ]]; then
    for (( j = i * i; j <= limit; j += i )); do composite[j]=1; done
  fi
done
out=()
for (( p = 3; p + 2 <= limit; p++ )); do
  [[ -z ${composite[p]} && -z ${composite[p+2]} ]] && out+=("($p,$((p + 2)))")
done
echo "${out[*]}" # (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
