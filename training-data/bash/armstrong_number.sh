#!/usr/bin/env bash
set -euo pipefail

is_armstrong() {
    local num=$1
    local original=$num
    local digits=${#num}
    local sum=0
    local digit

    while ((num > 0)); do
        digit=$((num % 10))
        sum=$((sum + digit ** digits))
        num=$((num / 10))
    done

    if ((sum == original)); then
        echo "true"
    else
        echo "false"
    fi
}

for n in 153 9474 123 370; do
    echo "$n: $(is_armstrong "$n")"
done
