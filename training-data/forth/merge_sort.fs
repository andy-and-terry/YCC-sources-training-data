CREATE ARR 9 , 3 , 7 , 1 , 8 , 2 , 5 , 4 ,
8 CONSTANT ARR-LEN
CREATE TEMP 8 CELLS ALLOT

: ELEM ( i -- addr ) CELLS ARR + ;
: TELEM ( i -- addr ) CELLS TEMP + ;

VARIABLE LO
VARIABLE MID
VARIABLE HI
VARIABLE LI
VARIABLE RI
VARIABLE TI
VARIABLE WIDTH

: MERGE-RUNS ( -- )
  LO @ LI !
  MID @ RI !
  LO @ TI !
  BEGIN
    LI @ MID @ < RI @ HI @ < AND
  WHILE
    LI @ ELEM @ RI @ ELEM @ <=
    IF
      LI @ ELEM @ TI @ TELEM !
      LI @ 1+ LI !
    ELSE
      RI @ ELEM @ TI @ TELEM !
      RI @ 1+ RI !
    THEN
    TI @ 1+ TI !
  REPEAT
  BEGIN LI @ MID @ < WHILE
    LI @ ELEM @ TI @ TELEM !
    LI @ 1+ LI !
    TI @ 1+ TI !
  REPEAT
  BEGIN RI @ HI @ < WHILE
    RI @ ELEM @ TI @ TELEM !
    RI @ 1+ RI !
    TI @ 1+ TI !
  REPEAT
  HI @ LO @ DO
    I TELEM @ I ELEM !
  LOOP ;

: MERGE-SORT ( -- )
  1 WIDTH !
  BEGIN
    WIDTH @ ARR-LEN <
  WHILE
    0 LO !
    BEGIN
      LO @ ARR-LEN <
    WHILE
      LO @ WIDTH @ + ARR-LEN MIN MID !
      LO @ WIDTH @ 2* + ARR-LEN MIN HI !
      MERGE-RUNS
      LO @ WIDTH @ 2* + LO !
    REPEAT
    WIDTH @ 2* WIDTH !
  REPEAT ;

: PRINT-ARR ( -- )
  ARR-LEN 0 DO I ELEM @ . LOOP ;

MERGE-SORT
PRINT-ARR
CR
