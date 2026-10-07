#!/usr/bin/env bash
set -euo pipefail

arr=(a b c d e f g)

echo "${arr[@]:2:3}"
echo "${arr[@]: -3}"
echo "${arr[@]:0:1}"

removed=("${arr[@]:0:2}" "${arr[@]:4}")
echo "${removed[@]}"
