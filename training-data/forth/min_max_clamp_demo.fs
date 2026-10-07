: CLAMP ( n lo hi -- n' ) ROT MIN MAX ;

: IN-RANGE? ( n lo hi -- flag ) 1+ WITHIN ;

: SIGN ( n -- -1|0|1 )
  DUP 0< IF DROP -1 EXIT THEN
  0> IF 1 ELSE 0 THEN ;

: PERCENT ( n -- n' ) 0 100 CLAMP ;

150 PERCENT . CR
-20 PERCENT . CR
42 PERCENT . CR
5 1 10 IN-RANGE? . CR
11 1 10 IN-RANGE? . CR
-9 SIGN . 0 SIGN . 33 SIGN . CR
3 9 MIN . 3 9 MAX . CR
-5 ABS . 4 NEGATE . CR
10 3 /MOD . . CR
-7 2 FM/MOD . . CR
