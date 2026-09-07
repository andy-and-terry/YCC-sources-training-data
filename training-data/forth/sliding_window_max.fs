CREATE ARR 1 , 3 , -1 , -3 , 5 , 3 , 6 , 7 ,
8 CONSTANT ARR-LEN
3 CONSTANT WINDOW

: ELEM ( i -- addr ) CELLS ARR + ;

: WINDOW-MAX ( start -- max )
  DUP ELEM @
  SWAP >R
  WINDOW 1 DO
    R@ I + ELEM @
    MAX
  LOOP
  R> DROP ;

: PRINT-RESULTS ( -- )
  ARR-LEN WINDOW - 1+ 0 DO
    I WINDOW-MAX .
  LOOP ;

PRINT-RESULTS
CR
