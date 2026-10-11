: POW10 ( n -- 10^n ) 1 SWAP 0 ?DO 10 * LOOP ;

: SHOW-TABLE ( -- ) 10 0 DO I . ." : " I POW10 . CR LOOP ;
SHOW-TABLE

\ number of decimal digits using powers of ten
: DIGITS ( n -- k ) 1 BEGIN SWAP 10 / DUP WHILE SWAP 1+ REPEAT DROP ;
12345 DIGITS . CR
7 DIGITS . CR
