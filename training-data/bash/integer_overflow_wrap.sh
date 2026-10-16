#!/usr/bin/env bash
# Bash uses signed 64-bit arithmetic, so values wrap.
max=9223372036854775807
echo "max      = $max"
echo "max + 1  = $(( max + 1 ))"
echo "-max - 2 = $(( -max - 2 ))"
