\ -7 divided by 2 using each rounding convention
-7 S>D 2 FM/MOD . . CR     \ floored: quotient -4, remainder 1
-7 S>D 2 SM/REM . . CR     \ symmetric: quotient -3, remainder -1
7 S>D -2 FM/MOD . . CR
7 S>D -2 SM/REM . . CR

: FLOOR-DIV ( a b -- q ) >R S>D R> FM/MOD NIP ;
: FLOOR-MOD ( a b -- r ) >R S>D R> FM/MOD DROP ;

-7 2 FLOOR-DIV . CR
-7 2 FLOOR-MOD . CR
