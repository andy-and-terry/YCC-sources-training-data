#!/usr/bin/env bash
# Twin primes below 50 using a sieve.
declare -a s
for ((i = 0; i <= 52; i++)); do s[i]=1; done
s[0]=0; s[1]=0
for ((i = 2; i * i <= 52; i++)); do
  ((s[i])) && for ((j = i * i; j <= 52; j += i)); do s[j]=0; done
done
for ((p = 2; p <= 50; p++)); do ((s[p] && s[p + 2])) && printf '(%d,%d) ' "$p" $((p + 2)); done
echo
