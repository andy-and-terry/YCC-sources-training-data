CREATE WEIGHTS 2 , 3 , 4 , 5 ,
CREATE VALUES 3 , 4 , 5 , 6 ,
4 CONSTANT NITEMS
10 CONSTANT CAPACITY
CREATE TABLE 100 CELLS ALLOT
VARIABLE COLS
VARIABLE ROW
VARIABLE COLIDX

: W@ ( item -- w ) CELLS WEIGHTS + @ ;
: V@ ( item -- v ) CELLS VALUES + @ ;
: TCELL ( row col -- addr ) SWAP COLS @ * + CELLS TABLE + ;

: BUILD-KNAPSACK ( -- )
  CAPACITY 1+ COLS !
  NITEMS 1+ 0 DO
    I ROW !
    CAPACITY 1+ 0 DO
      I COLIDX !
      ROW @ 0= COLIDX @ 0= OR
      IF
        0 ROW @ COLIDX @ TCELL !
      ELSE
        ROW @ 1- W@ COLIDX @ >
        IF
          ROW @ 1- COLIDX @ TCELL @ ROW @ COLIDX @ TCELL !
        ELSE
          ROW @ 1- COLIDX @ TCELL @
          ROW @ 1- COLIDX @ ROW @ 1- W@ - TCELL @ ROW @ 1- V@ +
          MAX
          ROW @ COLIDX @ TCELL !
        THEN
      THEN
    LOOP
  LOOP ;

: KNAPSACK ( -- max-value )
  BUILD-KNAPSACK
  NITEMS CAPACITY TCELL @ ;

KNAPSACK . CR
