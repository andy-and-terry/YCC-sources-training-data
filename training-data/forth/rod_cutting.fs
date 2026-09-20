CREATE PRICE 1 , 5 , 8 , 9 , 10 , 17 , 17 , 20 ,
8 CONSTANT ROD-LEN
CREATE DP 9 CELLS ALLOT
VARIABLE LEN
VARIABLE CUTIDX
VARIABLE BEST
VARIABLE CAND

: PRICE@ ( i -- p ) CELLS PRICE + @ ;
: DP@ ( i -- addr ) CELLS DP + ;

: INIT-DP ( -- )
  0 0 DP@ ! ;

: COMPUTE-DP ( -- )
  ROD-LEN 1+ 1 DO
    I LEN !
    0 BEST !
    LEN @ 0 DO
      I CUTIDX !
      CUTIDX @ PRICE@ LEN @ CUTIDX @ 1+ - DP@ @ + CAND !
      CAND @ BEST @ MAX BEST !
    LOOP
    BEST @ LEN @ DP@ !
  LOOP ;

: ROD-CUTTING ( -- max-revenue )
  INIT-DP
  COMPUTE-DP
  ROD-LEN DP@ @ ;

ROD-CUTTING . CR
