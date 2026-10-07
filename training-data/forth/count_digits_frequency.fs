\ Histogram of decimal digits in a number
CREATE FREQ 10 CELLS ALLOT

: CLEAR-FREQ ( -- )  FREQ 10 CELLS ERASE ;
: BUMP ( d -- )  CELLS FREQ + 1 SWAP +! ;

: TALLY ( n -- )
  BEGIN 10 /MOD SWAP BUMP DUP 0= UNTIL DROP ;

: SHOW-FREQ ( -- )  10 0 DO I . ." : " FREQ I CELLS + @ . CR LOOP ;

CLEAR-FREQ
112233445 TALLY
SHOW-FREQ
