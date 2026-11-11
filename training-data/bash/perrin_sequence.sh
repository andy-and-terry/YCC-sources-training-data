#!/usr/bin/env bash
# Perrin sequence P(n)=P(n-2)+P(n-3)
v=(3 0 2)
for (( i = 3; i < 10; i++ )); do
    v[i]=$(( v[i - 2] + v[i - 3] ))
done
echo "${v[@]}"
