#!/usr/bin/env bash
set -euo pipefail

seq=(1 2 2)
for (( i = 2; ${#seq[@]} < 20; i++ )); do
  value=$(( 3 - seq[${#seq[@]} - 1] ))
  for (( k = 0; k < seq[i]; k++ )); do
    seq+=("$value")
  done
done
echo "${seq[*]:0:20}"
