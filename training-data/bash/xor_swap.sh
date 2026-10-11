#!/usr/bin/env bash
# Swap two integers with XOR.
a=17 b=42
echo "before: a=$a b=$b"
(( a ^= b, b ^= a, a ^= b ))
echo "after:  a=$a b=$b"
