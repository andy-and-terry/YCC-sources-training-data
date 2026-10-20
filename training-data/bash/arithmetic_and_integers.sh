#!/usr/bin/env bash
a=17 b=5
echo $(( a / b )) $(( a % b )) $(( a ** 2 )) $(( a << 2 )) $(( a & b )) $(( a | b )) $(( a ^ b ))
(( a > b )) && echo "greater"
(( count = a * 2, count++ ))
echo "$count"
declare -i n=3
n+=4
echo "$n"
printf '%d %x %o %05.1f\n' 255 255 8 3.14159
echo "scale: $(echo 'scale=3; 10/3' | bc 2>/dev/null || echo 3.333)"
