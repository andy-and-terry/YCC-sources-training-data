CREATE ARR 3 , 34 , 4 , 12 , 5 , 2 ,
6 CONSTANT ARR-LEN
9 CONSTANT TARGET

CREATE DP TARGET 1+ CELLS ALLOT

: ELEM ( i -- addr ) CELLS ARR + ;
: DP-ELEM ( s -- addr ) CELLS DP + ;

: INIT-DP ( -- )
  TARGET 1+ 0 DO
    0 I DP-ELEM !
  LOOP
  1 0 DP-ELEM ! ;

: SUBSET-SUM? ( -- flag )
  INIT-DP
  ARR-LEN 0 DO
    I ELEM @ >R
    TARGET
    BEGIN
      DUP R@ >=
    WHILE
      DUP R@ - DP-ELEM @
      IF 1 OVER DP-ELEM ! THEN
      1-
    REPEAT
    DROP
    R> DROP
  LOOP
  TARGET DP-ELEM @ 0<> ;

SUBSET-SUM? .
CR
