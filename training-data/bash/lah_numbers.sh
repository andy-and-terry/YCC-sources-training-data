#!/usr/bin/env bash
# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
fact() { local f=1 i; for ((i = 2; i <= $1; i++)); do f=$((f * i)); done; echo "$f"; }
comb() { echo $(($(fact "$1") / ($(fact "$2") * $(fact $(($1 - $2)))))); }
n=5
out=()
for ((k = 1; k <= n; k++)); do
    out+=($(($(comb $((n - 1)) $((k - 1)) ) * $(fact $n) / $(fact $k))))
done
echo "${out[*]}"
