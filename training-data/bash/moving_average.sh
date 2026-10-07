#!/usr/bin/env bash
set -euo pipefail

# Simple moving average over a window of 3 and an exponential average with alpha 0.5.
printf '%s\n' 10 11 12 13 12 11 15 18 17 16 |
    awk -v k=3 -v alpha=0.5 '{
        win[NR % k] = $1
        sum += $1
        if (NR > k) sum -= old
        old = win[(NR + 1) % k]
        n = NR < k ? NR : k
        ema = NR == 1 ? $1 : alpha * $1 + (1 - alpha) * ema
        printf "%5.1f  sma=%7.3f  ema=%7.3f\n", $1, sum / n, ema
    }'
