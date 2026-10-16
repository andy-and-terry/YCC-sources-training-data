\ Signum: -1, 0 or 1
: SIGN ( n -- -1|0|1 )
  DUP 0< IF DROP -1 EXIT THEN
  0> IF 1 ELSE 0 THEN ;

: TEST ( n -- ) DUP . ." sign = " SIGN . CR ;

-42 TEST
0 TEST
99 TEST
