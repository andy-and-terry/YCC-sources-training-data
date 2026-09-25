#!/usr/bin/env bash
set -euo pipefail

n=${1:-4}
declare -A g
top=0 left=0 bottom=$((n - 1)) right=$((n - 1)) k=1
while ((top <= bottom && left <= right)); do
  for ((c = left; c <= right; c++)); do g[$top,$c]=$((k++)); done
  ((++top))
  for ((r = top; r <= bottom; r++)); do g[$r,$right]=$((k++)); done
  ((right--)) || true
  if ((top <= bottom)); then
    for ((c = right; c >= left; c--)); do g[$bottom,$c]=$((k++)); done
    ((bottom--)) || true
  fi
  if ((left <= right)); then
    for ((r = bottom; r >= top; r--)); do g[$r,$left]=$((k++)); done
    ((++left))
  fi
done

for ((r = 0; r < n; r++)); do
  for ((c = 0; c < n; c++)); do printf '%3d' "${g[$r,$c]}"; done
  echo
done
