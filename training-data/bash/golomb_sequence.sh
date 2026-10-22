#!/usr/bin/env bash
set -euo pipefail

g=(0 1)
for (( n = 2; n <= 20; n++ )); do
  g[n]=$(( 1 + g[n - g[g[n-1]]] ))
done
echo "${g[*]:1}"
