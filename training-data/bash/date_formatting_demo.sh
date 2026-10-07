#!/usr/bin/env bash
set -euo pipefail

ts=1700000000

echo "ISO date:     $(date -u -d "@$ts" +%Y-%m-%d)"
echo "Time:         $(date -u -d "@$ts" +%H:%M:%S)"
echo "Weekday:      $(date -u -d "@$ts" +%A)"
echo "Day of year:  $(date -u -d "@$ts" +%j)"

printf -v stamp '%(%Y%m%d)T' "$ts"
echo "printf stamp: $stamp"

d1=$(date -u -d "2024-03-01" +%s)
d2=$(date -u -d "2024-12-25" +%s)
echo "days between: $(( (d2 - d1) / 86400 ))"
