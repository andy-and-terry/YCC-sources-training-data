#!/usr/bin/env bash
n=50
declare -a composite
for (( i = 2; i * i <= n; i++ )); do
  [[ -z ${composite[i]:-} ]] && for (( j = i * i; j <= n; j += i )); do composite[j]=1; done
done
for (( p = 3; p + 2 <= n; p++ )); do
  [[ -z ${composite[p]:-} && -z ${composite[p+2]:-} ]] && printf '(%d, %d) ' "$p" $(( p + 2 ))
done
echo
