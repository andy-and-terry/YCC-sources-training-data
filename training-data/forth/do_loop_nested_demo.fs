\ Nested DO loops with I and J, plus LEAVE

: MULT-TABLE ( n -- )
  1+ 1 DO
    11 1 DO
      J I * 4 .R
    LOOP CR
  LOOP ;

: FIND-FIRST-MULTIPLE ( divisor -- n )
  0 SWAP
  101 1 DO
    I OVER MOD 0= IF DROP I LEAVE THEN
  LOOP
  SWAP DROP ;

3 MULT-TABLE
7 13 * . CR
17 FIND-FIRST-MULTIPLE . CR
: TRIANGLE ( n -- )
  1+ 1 DO I 0 DO [CHAR] * EMIT LOOP CR LOOP ;
5 TRIANGLE
