CREATE ARR 2 , 7 , 11 , 15 ,
4 CONSTANT ARR-LEN

: ELEM ( i -- addr ) CELLS ARR + ;

: TWO-SUM ( target -- i j )
  >R
  ARR-LEN 0 DO
    ARR-LEN I 1+ DO
      J ELEM @ I ELEM @ + R@ =
      IF J I R> DROP UNLOOP UNLOOP EXIT THEN
    LOOP
  LOOP
  R> DROP -1 -1 ;

9 TWO-SUM . .
CR
