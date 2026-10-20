#!/usr/bin/env bash
set -euo pipefail

echo {1..5} {a,b,c}{1,2} file{,.bak} {01..03}
d=$(mktemp -d); trap 'rm -rf "$d"' EXIT
touch "$d"/{one,two,three}.txt "$d"/.hidden
cd "$d"
echo *.txt
shopt -s dotglob nullglob
files=(*)
echo "${#files[@]}"
