#!/usr/bin/env bash
set -euo pipefail

red=$'\e[31m'; reset=$'\e[0m'
printf '%-10s %5s %8s\n' Name Qty Price
printf '%-10s %5d %8.2f\n' apple 3 1.5 kiwi 12 0.25
printf '%s\n' "${red}error${reset}" | cat -v
printf '%*s|\n' 8 right
printf '%-*s|\n' 8 left
printf '%q\n' 'with space and $dollar'
