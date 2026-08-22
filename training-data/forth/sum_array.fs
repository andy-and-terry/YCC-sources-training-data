CREATE NUMBERS 5 , 3 , 8 , 1 , 9 , 2 ,

: SUM-ARRAY ( addr count -- sum )
  0 SWAP 0 DO
    OVER I CELLS + @ +
  LOOP
  SWAP DROP ;

NUMBERS 6 SUM-ARRAY . CR
