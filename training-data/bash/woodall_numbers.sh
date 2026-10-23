#!/usr/bin/env bash
set -euo pipefail

out=()
for n in {1..10}; do
  out+=($(( n * (1 << n) - 1 )))
done
echo "${out[*]}"
