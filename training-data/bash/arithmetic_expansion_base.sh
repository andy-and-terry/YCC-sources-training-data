#!/usr/bin/env bash
set -euo pipefail

echo $(( 7 / 2 )) $(( 7 % 3 )) $(( 2 ** 10 )) $(( 0xff )) $(( 2#101 )) $(( 8#17 ))
x=5; (( x++ )); (( x *= 3 )); echo "$x"
echo $(( x > 10 ? 1 : 0 )) $(( x & 6 )) $(( x << 2 )) $(( ~x ))
printf '%d %x %o %e\n' 255 255 255 1234.5
printf '%05.1f|%-5s|%5s\n' 3.14159 ab cd
echo "scale=3; 10/3" | bc
