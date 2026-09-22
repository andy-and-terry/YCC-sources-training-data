#!/usr/bin/env bash
set -euo pipefail

printf "%-10s|%10s|\n" "left" "right"
printf "%05d\n" 42
printf "%+d %+d\n" 7 -7
printf "%.2f\n" 3.14159
printf "%x %X %o\n" 255 255 8
printf "%c\n" "Hello"
