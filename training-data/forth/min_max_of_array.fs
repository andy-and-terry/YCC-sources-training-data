CREATE ARR 5 , 3 , 8 , 1 , 9 , 2 ,
6 CONSTANT ARR-LEN

: ELEM ( i -- addr ) CELLS ARR + ;

: MIN-MAX ( -- min max )
  0 ELEM @ DUP
  1 ARR-LEN 1 DO
    I ELEM @
    DUP ROT MIN
    SWAP ROT MAX SWAP
  LOOP ;

MIN-MAX . .
CR
