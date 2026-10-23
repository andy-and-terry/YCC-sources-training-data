#!/usr/bin/env bash
# Motzkin numbers via recurrence.
m=(1 1)
for ((i = 2; i < 10; i++)); do
  m[i]=$(( ((2 * i + 1) * m[i - 1] + 3 * (i - 1) * m[i - 2]) / (i + 2) ))
done
echo "${m[*]}"
