: COUNT-BY-THREES ( -- )
  20 0 DO I . 3 +LOOP CR ;

: COUNTDOWN ( -- )
  0 10 DO I . -2 +LOOP CR ;

: ODD-SQUARES ( n -- )
  1 DO
    I DUP * .
  2 +LOOP CR ;

: EARLY-EXIT ( -- )
  100 0 DO
    I I * 50 > IF
      ." stopped at " I . CR
      LEAVE
    THEN
  LOOP ;

COUNT-BY-THREES
COUNTDOWN
10 ODD-SQUARES
EARLY-EXIT
