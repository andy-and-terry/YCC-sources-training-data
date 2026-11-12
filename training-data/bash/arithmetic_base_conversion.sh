#!/usr/bin/env bash
echo $(( 2#1010 )) $(( 16#ff )) $(( 8#17 ))
printf '%x %o %b\n' 255 8 5 2>/dev/null || printf '%x %o\n' 255 8
echo $(( (7 << 2) | 1 )) $(( 17 % 5 )) $(( 2 ** 10 ))
