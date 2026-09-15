CREATE ARR 12 , 34 , 54 , 2 , 3 , -1 , 45 , 6 ,
8 CONSTANT ARR-LEN

: ELEM ( i -- addr ) CELLS ARR + ;

VARIABLE GAP
VARIABLE IDX
VARIABLE TEMP
VARIABLE J

: SHELL-SORT ( -- )
  ARR-LEN 2 / GAP !
  BEGIN
    GAP @ 0>
  WHILE
    GAP @ IDX !
    BEGIN
      IDX @ ARR-LEN <
    WHILE
      IDX @ ELEM @ TEMP !
      IDX @ J !
      BEGIN
        J @ GAP @ >=
        IF
          J @ GAP @ - ELEM @ TEMP @ >
        ELSE
          FALSE
        THEN
      WHILE
        J @ GAP @ - ELEM @ J @ ELEM !
        GAP @ NEGATE J +!
      REPEAT
      TEMP @ J @ ELEM !
      1 IDX +!
    REPEAT
    GAP @ 2 / GAP !
  REPEAT ;

: PRINT-ARR ( -- )
  ARR-LEN 0 DO I ELEM @ . LOOP ;

SHELL-SORT
PRINT-ARR
CR
