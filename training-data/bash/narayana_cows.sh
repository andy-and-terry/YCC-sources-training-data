#!/usr/bin/env bash
# Narayana's cows N(n)=N(n-1)+N(n-3)
v=(1 1 1)
for (( i = 3; i < 10; i++ )); do
    v[i]=$(( v[i - 1] + v[i - 3] ))
done
echo "${v[@]}"
