CREATE MATA 1 , 2 , 3 , 4 , 5 , 6 ,
CREATE MATB 7 , 8 , 9 , 10 , 11 , 12 ,
CREATE MATC 4 CELLS ALLOT
2 CONSTANT AROWS
3 CONSTANT ACOLS
2 CONSTANT BCOLS

: A@ ( row col -- addr ) SWAP ACOLS * + CELLS MATA + ;
: B@ ( row col -- addr ) SWAP BCOLS * + CELLS MATB + ;
: C@ ( row col -- addr ) SWAP BCOLS * + CELLS MATC + ;

VARIABLE ROW
VARIABLE COL
VARIABLE SUM
VARIABLE K

: MATMUL ( -- )
  AROWS 0 DO
    I ROW !
    BCOLS 0 DO
      I COL !
      0 SUM !
      0 K !
      BEGIN
        K @ ACOLS <
      WHILE
        ROW @ K @ A@ @ K @ COL @ B@ @ * SUM +!
        1 K +!
      REPEAT
      SUM @ ROW @ COL @ C@ !
    LOOP
  LOOP ;

: PRINT-MATC ( -- )
  AROWS 0 DO
    BCOLS 0 DO
      J I C@ @ .
    LOOP
    CR
  LOOP ;

MATMUL
PRINT-MATC
