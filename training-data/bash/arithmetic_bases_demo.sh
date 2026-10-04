#!/usr/bin/env bash
set -euo pipefail

# Number bases inside $(( ))
echo $((2#1011))      # binary  -> 11
echo $((8#17))        # octal   -> 15
echo $((16#ff))       # hex     -> 255
echo $((36#z))        # base 36 -> 35

# Bitwise operators
a=12   # 1100
b=10   # 1010
echo "and: $((a & b))  or: $((a | b))  xor: $((a ^ b))  not: $((~a))"
echo "shl: $((a << 2))  shr: $((a >> 2))"

# Convert decimal to binary with a loop
n=37
bin=""
while ((n > 0)); do
    bin="$((n % 2))$bin"
    n=$((n / 2))
done
echo "37 in binary: $bin"

# printf can do the conversions too
printf '%d in hex is %x, in octal is %o\n' 255 255 255

# Compound assignment, increments, ternary
x=5
((x += 3, x *= 2))
echo "x=$x"
echo "max: $(( a > b ? a : b ))"

# Integer division truncates toward zero
echo $((-7 / 2)) $((-7 % 3))
