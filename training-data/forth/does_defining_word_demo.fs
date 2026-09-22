: ARRAY ( n "name" -- )
  CREATE CELLS ALLOT
  DOES> ( i -- addr )
  SWAP CELLS + ;

5 ARRAY NUMS

: FILL-NUMS ( -- )
  10 0 NUMS !
  20 1 NUMS !
  30 2 NUMS !
  40 3 NUMS !
  50 4 NUMS ! ;

: PRINT-NUMS ( -- )
  5 0 DO
    I NUMS @ .
  LOOP ;

FILL-NUMS
PRINT-NUMS
CR
