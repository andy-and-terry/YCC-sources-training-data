#!/usr/bin/env bash
set -euo pipefail

out=()
for n in {0..9}; do
  out+=($(( n * (1 << n) + 1 )))
done
echo "${out[*]}"
