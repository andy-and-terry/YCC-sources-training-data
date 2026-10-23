#!/usr/bin/env bash
set -euo pipefail

a=(apple banana cherry)
b=(banana cherry date)

comm -13 <(printf '%s\n' "${a[@]}") <(printf '%s\n' "${b[@]}")
while read -r line; do
    echo "got: $line"
done < <(printf '%s\n' one two three)
