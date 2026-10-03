CREATE ARR 10 , 9 , 2 , 5 , 3 , 7 , 101 , 18 ,
8 CONSTANT ARR-LEN
CREATE LEN-ARR ARR-LEN CELLS ALLOT

: ELEM ( i -- addr ) CELLS ARR + ;
: LEN@ ( i -- addr ) CELLS LEN-ARR + ;

: INIT ( -- )
  ARR-LEN 0 DO 1 I LEN@ ! LOOP ;

: LIS ( -- max )
  INIT
  ARR-LEN 1 DO
    I 0 DO
      J ELEM @ I ELEM @ < IF
        J LEN@ @ 1+ I LEN@ @ MAX I LEN@ !
      THEN
    LOOP
  LOOP
  0
  ARR-LEN 0 DO I LEN@ @ MAX LOOP ;

LIS . CR
