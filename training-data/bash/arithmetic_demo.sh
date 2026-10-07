#!/usr/bin/env bash
# Integer arithmetic, bit operations and floating point via bc.
a=17; b=5
echo "sum=$((a + b)) diff=$((a - b)) prod=$((a * b)) quot=$((a / b)) rem=$((a % b))"
echo "pow=$((a ** 2)) shl=$((a << 2)) and=$((a & b)) xor=$((a ^ b))"
((a += 3)); echo "a=$a"
echo "hex=$((16#ff)) oct=$((8#17)) bin=$((2#1010))"
echo "float: $(echo 'scale=3; 22/7' | bc)"
((a > b)) && echo "a greater than b"
