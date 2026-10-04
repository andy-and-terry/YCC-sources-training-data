\ Early exit from counted loops with LEAVE and UNLOOP EXIT

: FIRST-SQUARE-OVER ( n -- m )
  1 ?DO
    I I * OVER > IF
      DROP I I * UNLOOP EXIT
    THEN
  LOOP
  DROP -1 ;

: COUNT-TO-LEAVE
  10 0 DO
    I 5 = IF LEAVE THEN
    I .
  LOOP CR ;

COUNT-TO-LEAVE
50 FIRST-SQUARE-OVER . CR
