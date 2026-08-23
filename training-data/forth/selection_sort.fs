CREATE ARR 5 , 3 , 8 , 1 , 9 , 2 ,
6 CONSTANT ARR-LEN

: ELEM ( i -- addr ) CELLS ARR + ;

: FIND-MIN-IDX ( start -- idx )
  DUP >R
  ARR-LEN R@ DO
    I ELEM @ R@ ELEM @ <
    IF R> DROP I >R THEN
  LOOP
  R> ;

: SWAP-ELEMS ( i j -- )
  ELEM SWAP ELEM
  DUP @ >R
  DUP @ OVER !
  R> SWAP ! ;

: SELECTION-SORT ( -- )
  ARR-LEN 1- 0 DO
    I FIND-MIN-IDX
    I OVER =
    IF DROP ELSE I SWAP SWAP-ELEMS THEN
  LOOP ;

: PRINT-ARR ( -- )
  ARR-LEN 0 DO I ELEM @ . LOOP ;

SELECTION-SORT
PRINT-ARR
CR
