CREATE ARR 9 , 3 , 7 , 1 , 8 , 2 ,
6 CONSTANT ARR-LEN

: ELEM ( i -- addr ) CELLS ARR + ;

: SWAP-ELEMS ( i j -- )
  ELEM SWAP ELEM
  DUP @ >R
  DUP @ OVER !
  R> SWAP ! ;

: PARTITION ( lo hi -- p )
  2DUP ELEM @ >R
  OVER 1-
  SWAP
  2 PICK SWAP
  DO
    I ELEM @ R@ <
    IF
      1 SWAP - NEGATE
    THEN
  LOOP
  R> DROP ;

: PRINT-ARR ( -- )
  ARR-LEN 0 DO I ELEM @ . LOOP ;

PRINT-ARR
CR
