#!/usr/bin/env bash
set -euo pipefail

echo $((2#1010))   # binary -> 10
echo $((8#17))     # octal  -> 15
echo $((16#ff))    # hex    -> 255
echo $((36#z))     # base36 -> 35

n=255
printf 'dec=%d hex=%x oct=%o\n' "$n" "$n" "$n"
