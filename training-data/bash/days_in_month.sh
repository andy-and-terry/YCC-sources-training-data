#!/usr/bin/env bash
# Days in a given month, with leap-year handling.
days_in_month() {
    local y=$1 m=$2
    case $m in
        1|3|5|7|8|10|12) echo 31 ;;
        4|6|9|11) echo 30 ;;
        2) if (( (y % 4 == 0 && y % 100 != 0) || y % 400 == 0 )); then echo 29; else echo 28; fi ;;
    esac
}
echo "Feb 2024: $(days_in_month 2024 2)"
echo "Feb 1900: $(days_in_month 1900 2)"
echo "Feb 2000: $(days_in_month 2000 2)"
echo "Apr 2023: $(days_in_month 2023 4)"
