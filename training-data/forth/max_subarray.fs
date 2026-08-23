CREATE ARR -2 , 1 , -3 , 4 , -1 , 2 , 1 , -5 , 4 ,
9 CONSTANT ARR-LEN

: ELEM ( i -- addr ) CELLS ARR + ;

: KADANE ( -- max )
  0 ELEM @ 0 ELEM @
  1 ARR-LEN 1 DO
    I ELEM @
    OVER + OVER MAX
    SWAP DROP
    DUP >R
    2DUP MAX SWAP DROP
    R> SWAP DROP
  LOOP
  DROP ;

KADANE .
CR
