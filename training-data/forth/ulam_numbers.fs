CREATE T 16 CELLS ALLOT
VARIABLE N

: T@ ( i -- n )  CELLS T + @ ;
: T! ( n i -- )  CELLS T + ! ;

: WAYS ( c -- ways )
  0 SWAP                         \ ways c
  N @ 0 DO
    N @ I 1+ DO
      DUP I T@ J T@ + = IF SWAP 1+ SWAP THEN
    LOOP
  LOOP
  DROP ;

: ULAM ( -- )
  1 0 T!  2 1 T!  2 N !
  3                              \ candidate
  BEGIN N @ 15 < WHILE
    DUP WAYS 1 = IF DUP N @ T! 1 N +! THEN
    1+
  REPEAT
  DROP
  15 0 DO I T@ . LOOP CR ;

ULAM
