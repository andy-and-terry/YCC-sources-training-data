#!/usr/bin/env bash
# Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
# bash arithmetic is 64-bit, so only s(0)..s(6) fit.
s=2
for ((i = 0; i < 7; i++)); do
  echo "s($i) = $s"
  s=$((s * s - s + 1))
done
