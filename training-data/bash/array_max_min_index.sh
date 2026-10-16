#!/usr/bin/env bash
# Find the index of the maximum and minimum element.
nums=(14 3 99 27 -5 60)
max_i=0 min_i=0
for i in "${!nums[@]}"; do
    (( nums[i] > nums[max_i] )) && max_i=$i
    (( nums[i] < nums[min_i] )) && min_i=$i
done
echo "max ${nums[max_i]} at index $max_i"
echo "min ${nums[min_i]} at index $min_i"
