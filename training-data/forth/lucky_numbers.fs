CREATE LK 50 CELLS ALLOT
VARIABLE LEN
VARIABLE STEP
VARIABLE KEPT

: LK@ ( i -- n )  CELLS LK + @ ;
: LK! ( n i -- )  CELLS LK + ! ;

: REMOVE-EVERY ( step -- )
  STEP !  0 KEPT !
  LEN @ 0 DO
    I 1+ STEP @ MOD 0<> IF
      I LK@ KEPT @ LK!
      1 KEPT +!
    THEN
  LOOP
  KEPT @ LEN ! ;

: LUCKY ( -- )
  50 0 DO I 2* 1+ I LK! LOOP
  50 LEN !
  1                              \ idx
  BEGIN
    DUP LEN @ < IF DUP LK@ LEN @ <= ELSE FALSE THEN
  WHILE
    DUP LK@ REMOVE-EVERY
    1+
  REPEAT
  DROP
  LEN @ 0 DO I LK@ . LOOP CR ;

LUCKY
