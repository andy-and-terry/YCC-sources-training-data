10 CONSTANT SIZE
CREATE TBL SIZE SIZE * CELLS ALLOT

: D[] ( m n -- addr )  SWAP SIZE * + CELLS TBL + ;

: FILL-TABLE ( -- )
  SIZE 0 DO                      \ J = m
    SIZE 0 DO                    \ I = n
      I 0= J 0= OR IF
        1
      ELSE
        J 1- I D[] @  J I 1- D[] @ +  J 1- I 1- D[] @ +
      THEN
      J I D[] !
    LOOP
  LOOP ;

: DELANNOY ( -- )
  FILL-TABLE
  SIZE 0 DO I I D[] @ . LOOP CR ;

DELANNOY
