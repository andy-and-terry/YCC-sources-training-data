#!/usr/bin/env bash
set -euo pipefail

declare -i total=0
total+=5
total+="3 + 2"
echo "$total"

declare -i x=10
x="4 * 2"
echo "$x"

declare -i y=7
((y *= 3))
echo "$y"
