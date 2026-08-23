CREATE ARR 12 , 11 , 13 , 5 , 6 ,
5 CONSTANT ARR-LEN

: ELEM ( i -- addr ) CELLS ARR + ;

: INSERTION-SORT ( -- )
  1 ARR-LEN 1- DO
    I ELEM @
    I
    BEGIN
      DUP 0 >
      IF
        DUP 1- ELEM @ 2 PICK >
      ELSE
        FALSE
      THEN
    WHILE
      DUP ELEM DUP 1- ELEM @ SWAP !
      1-
    REPEAT
    ELEM !
  LOOP ;

: PRINT-ARR ( -- )
  ARR-LEN 0 DO I ELEM @ . LOOP ;

INSERTION-SORT
PRINT-ARR
CR
