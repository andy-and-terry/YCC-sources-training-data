CREATE ARR 10 , 20 , 30 , 40 , 50 ,
5 CONSTANT ARR-LEN

: ELEM ( i -- addr ) CELLS ARR + ;

: ARRAY-SUM ( -- sum )
  0 ARR-LEN 0 DO I ELEM @ + LOOP ;

: ARRAY-AVG ( -- avg )
  ARRAY-SUM ARR-LEN / ;

ARRAY-SUM .
ARRAY-AVG .
CR
