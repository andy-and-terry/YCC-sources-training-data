CREATE U 15 CELLS ALLOT
VARIABLE LEN
VARIABLE CAND
VARIABLE WAYS

: U@ ( i -- n )  CELLS U + @ ;
: U! ( n i -- )  CELLS U + ! ;

: COUNT-WAYS ( cand len -- ways )
  SWAP CAND !  0 WAYS !
  DUP 0 ?DO
    DUP I 1+ ?DO
      J U@ I U@ + CAND @ = IF 1 WAYS +! THEN
    LOOP
  LOOP
  DROP WAYS @ ;

: ULAM ( -- )
  1 0 U!  2 1 U!  2 LEN !
  2                              \ candidate - 1
  BEGIN LEN @ 15 < WHILE
    1+
    DUP LEN @ COUNT-WAYS 1 = IF
      DUP LEN @ U!
      1 LEN +!
    THEN
  REPEAT
  DROP
  15 0 DO I U@ . LOOP CR ;

ULAM
