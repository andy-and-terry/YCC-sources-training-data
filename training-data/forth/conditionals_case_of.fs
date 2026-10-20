: CLASSIFY ( n -- ) CASE
    0 OF ." zero" ENDOF
    1 OF ." one" ENDOF
    2 OF ." two" ENDOF
    DUP . ." many"
  ENDCASE CR ;
0 CLASSIFY 1 CLASSIFY 2 CLASSIFY 9 CLASSIFY
: SIGN ( n -- -1|0|1 ) DUP 0< IF DROP -1 ELSE 0> IF 1 ELSE 0 THEN THEN ;
-5 SIGN . 0 SIGN . 8 SIGN . CR
: BETWEEN ( n lo hi -- flag ) 2 PICK < SWAP ROT <= 0= AND ;
: CLAMP ( n lo hi -- n' ) ROT MIN MAX ;
15 1 10 CLAMP . -3 1 10 CLAMP . CR
5 3 > . 5 3 < . 5 5 = . 5 5 <> . 0 0= . -1 0< . CR
