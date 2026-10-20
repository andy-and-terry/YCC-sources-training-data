#!/usr/bin/env bash
set -euo pipefail

line='name=Ada;age=36;city=London'
declare -A rec
IFS=';' read -ra pairs <<< "$line"
for p in "${pairs[@]}"; do rec[${p%%=*}]=${p#*=}; done
sep=''
printf '{'
for k in $(printf '%s\n' "${!rec[@]}" | sort); do printf '%s"%s":"%s"' "$sep" "$k" "${rec[$k]}"; sep=,; done
printf '}\n'
