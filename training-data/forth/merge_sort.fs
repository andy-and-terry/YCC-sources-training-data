CREATE ARR 5 , 2 , 9 , 1 , 5 , 6 , 3 , 8 ,
8 CONSTANT ARR-LEN
CREATE TEMP ARR-LEN CELLS ALLOT

VARIABLE WIDTH
VARIABLE START
VARIABLE LO
VARIABLE MID
VARIABLE HI
VARIABLE LEFT
VARIABLE RIGHT
VARIABLE OUT

: A@ ( idx -- addr ) CELLS ARR + ;
: T@ ( idx -- addr ) CELLS TEMP + ;

: COPY-BACK ( lo hi -- )
  1+ SWAP DO
    I T@ @ I A@ !
  LOOP ;

: MERGE-RUN ( lo mid hi -- )
  HI ! MID ! LO !
  LO @ LEFT !
  MID @ 1+ RIGHT !
  LO @ OUT !
  BEGIN
    LEFT @ MID @ <= RIGHT @ HI @ <= AND
  WHILE
    LEFT @ A@ @ RIGHT @ A@ @ <=
    IF
      OUT @ T@ LEFT @ A@ @ SWAP !
      1 LEFT +!
    ELSE
      OUT @ T@ RIGHT @ A@ @ SWAP !
      1 RIGHT +!
    THEN
    1 OUT +!
  REPEAT
  BEGIN
    LEFT @ MID @ <=
  WHILE
    OUT @ T@ LEFT @ A@ @ SWAP !
    1 LEFT +!
    1 OUT +!
  REPEAT
  BEGIN
    RIGHT @ HI @ <=
  WHILE
    OUT @ T@ RIGHT @ A@ @ SWAP !
    1 RIGHT +!
    1 OUT +!
  REPEAT
  LO @ HI @ COPY-BACK ;

: MERGE-SORT ( -- )
  1 WIDTH !
  BEGIN
    WIDTH @ ARR-LEN <
  WHILE
    0 START !
    BEGIN
      START @ ARR-LEN 1- <
    WHILE
      START @
      START @ WIDTH @ + 1- ARR-LEN 1- MIN
      START @ WIDTH @ 2* + 1- ARR-LEN 1- MIN
      MERGE-RUN
      WIDTH @ 2* START +!
    REPEAT
    WIDTH @ 2* WIDTH !
  REPEAT ;

: PRINT-ARR ( -- )
  ARR-LEN 0 DO I A@ @ . LOOP ;

MERGE-SORT
PRINT-ARR
CR
