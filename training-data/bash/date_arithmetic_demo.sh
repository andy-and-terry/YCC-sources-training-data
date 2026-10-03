#!/usr/bin/env bash
set -euo pipefail

today_epoch=$(date -d "2024-01-01" +%s)
future_epoch=$(date -d "2024-01-01 + 45 days" +%s)
diff_days=$(((future_epoch - today_epoch) / 86400))

echo "Start: $(date -d "@$today_epoch" +%Y-%m-%d)"
echo "45 days later: $(date -d "@$future_epoch" +%Y-%m-%d)"
echo "Difference in days: $diff_days"
