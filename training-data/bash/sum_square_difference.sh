#!/usr/bin/env bash
# Square of the sum minus sum of squares for 1..10 (expect 2640)
sum=0; squares=0
for (( i = 1; i <= 10; i++ )); do
    (( sum += i, squares += i * i ))
done
echo $(( sum * sum - squares ))
