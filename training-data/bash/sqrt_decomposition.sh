#!/usr/bin/env bash
a=(5 3 8 1 9 2 7 4 6 0 3 5); n=${#a[@]}; bs=4
declare -a blk
for ((i=0; i<n; i++)); do blk[i/bs]=$(( ${blk[i/bs]:-0} + a[i] )); done
l=2; r=9; sum=0; i=$l
while ((i <= r)); do
  if ((i % bs == 0 && i+bs-1 <= r)); then sum=$((sum + blk[i/bs])); i=$((i+bs))
  else sum=$((sum + a[i])); ((i++)); fi
done
echo "sum[$l..$r] = $sum"
