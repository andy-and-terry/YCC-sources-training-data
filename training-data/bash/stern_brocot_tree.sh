#!/usr/bin/env bash
# Path (L/R) to p/q in the Stern-Brocot tree.
gcd() { local a=$1 b=$2 t; while (( b )); do t=$((a % b)); a=$b; b=$t; done; echo "$a"; }
p=3; q=5
g=$(gcd $p $q); p=$((p/g)); q=$((q/g))
lp=0; lq=1; hp=1; hq=0; s=""
while :; do
  mp=$((lp+hp)); mq=$((lq+hq))
  (( mp == p && mq == q )) && break
  if (( p*mq < mp*q )); then s+=L; hp=$mp; hq=$mq; else s+=R; lp=$mp; lq=$mq; fi
done
echo "$s"
