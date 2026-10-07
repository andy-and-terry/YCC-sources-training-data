CREATE MAT 1 , 2 , 3 , 4 , 5 , 6 ,
CREATE TRANS 6 CELLS ALLOT
2 CONSTANT ROWS
3 CONSTANT COLS

: MAT@ ( row col -- addr ) SWAP COLS * + CELLS MAT + ;
: TRANS@ ( row col -- addr ) SWAP ROWS * + CELLS TRANS + ;

: TRANSPOSE ( -- )
  ROWS 0 DO
    COLS 0 DO
      I J MAT@ @ J I TRANS@ !
    LOOP
  LOOP ;

: PRINT-TRANS ( -- )
  COLS 0 DO
    ROWS 0 DO
      J I TRANS@ @ .
    LOOP
    CR
  LOOP ;

TRANSPOSE
PRINT-TRANS
