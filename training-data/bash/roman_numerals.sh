#!/usr/bin/env bash
set -euo pipefail

int_to_roman() {
    local num=$1
    local -a values=(1000 900 500 400 100 90 50 40 10 9 5 4 1)
    local -a symbols=(M CM D CD C XC L XL X IX V IV I)
    local result=""
    local i

    for ((i = 0; i < ${#values[@]}; i++)); do
        while ((num >= values[i])); do
            result+="${symbols[i]}"
            num=$((num - values[i]))
        done
    done
    echo "$result"
}

int_to_roman 1994
int_to_roman 58
int_to_roman 3999
