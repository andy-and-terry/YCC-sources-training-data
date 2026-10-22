#!/usr/bin/env bash
set -euo pipefail

q=(0 1 1)
for (( n = 3; n <= 20; n++ )); do
  q[n]=$(( q[n - q[n-1]] + q[n - q[n-2]] ))
done
echo "${q[*]:1}"
