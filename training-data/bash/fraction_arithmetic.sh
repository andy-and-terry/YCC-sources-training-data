#!/usr/bin/env bash
set -euo pipefail

gcd() { local a=${1#-} b=${2#-} t; while ((b)); do t=$((a % b)); a=$b; b=$t; done; echo "$a"; }

# Fractions are "n/d" strings, always normalised.
frac() {
    local n=$1 d=$2 g
    ((d == 0)) && { echo "zero denominator" >&2; return 1; }
    ((d < 0)) && { n=$((-n)); d=$((-d)); }
    g=$(gcd "$n" "$d"); ((g == 0)) && g=1
    n=$((n / g)); d=$((d / g))
    if ((d == 1)); then echo "$n"; else echo "$n/$d"; fi
}

parts() { local f=$1; if [[ $f == */* ]]; then echo "${f%/*} ${f#*/}"; else echo "$f 1"; fi; }

fop() {
    local a b c d
    read -r a b <<<"$(parts "$1")"
    read -r c d <<<"$(parts "$3")"
    case $2 in
        +) frac $((a * d + c * b)) $((b * d)) ;;
        -) frac $((a * d - c * b)) $((b * d)) ;;
        '*') frac $((a * c)) $((b * d)) ;;
        /) frac $((a * d)) $((b * c)) ;;
    esac
}

p=1/3 q=1/6
echo "$(fop $p + $q) $(fop $p - $q) $(fop $p '*' $q) $(fop $p / $q) $(fop 1 - $p)"
h=0
for ((k = 1; k <= 20; k++)); do h=$(fop "$h" + "1/$k"); done
echo "H(20) = $h"
