CREATE S 20 CELLS ALLOT

: S@ ( i -- n )  CELLS S + @ ;
: S! ( n i -- )  CELLS S + ! ;

: STERN ( -- )
  0 0 S!  1 1 S!
  20 2 DO
    I 2 MOD 0= IF
      I 2/ S@
    ELSE
      I 2/ S@  I 2/ 1+ S@ +
    THEN
    I S!
  LOOP
  20 0 DO I S@ . LOOP CR ;

STERN
