#!/usr/bin/env bash
set -euo pipefail

seq=(1 2)
for (( candidate = 3; ${#seq[@]} < 15; candidate++ )); do
  ways=0
  for (( i = 0; i < ${#seq[@]}; i++ )); do
    for (( j = i + 1; j < ${#seq[@]}; j++ )); do
      if (( seq[i] + seq[j] == candidate )); then
        ways=$(( ways + 1 ))
      fi
    done
  done
  if (( ways == 1 )); then
    seq+=("$candidate")
  fi
done
echo "${seq[*]}"
