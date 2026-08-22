#!/usr/bin/env bash
set -euo pipefail

is_leap_year() {
    local year=$1
    if ((year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))); then
        return 0
    fi
    return 1
}

for year in 2000 1900 2024 2023; do
    if is_leap_year "$year"; then
        echo "$year: leap"
    else
        echo "$year: not leap"
    fi
done
