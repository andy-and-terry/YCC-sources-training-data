#!/usr/bin/env bash
# First 15 ugly numbers (prime factors only 2, 3, 5).
u=(1)
i2=0; i3=0; i5=0
while (( ${#u[@]} < 15 )); do
  a=$((u[i2]*2)); b=$((u[i3]*3)); c=$((u[i5]*5))
  m=$a; (( b < m )) && m=$b; (( c < m )) && m=$c
  u+=("$m")
  (( m == a )) && ((i2++))
  (( m == b )) && ((i3++))
  (( m == c )) && ((i5++))
done
echo "${u[*]}"
