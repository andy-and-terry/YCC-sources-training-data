#!/usr/bin/env bash
set -euo pipefail

is_number() {
    [[ $1 =~ ^-?[0-9]+$ ]]
}

for value in 123 -45 abc 3.14; do
    if is_number "$value"; then
        echo "$value: number"
    else
        echo "$value: not a number"
    fi
done
