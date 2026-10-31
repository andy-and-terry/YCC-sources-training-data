VARIABLE N
VARIABLE P

: POWERFUL? ( n -- flag )
  N !  2 P !
  BEGIN P @ DUP * N @ <= WHILE
    N @ P @ MOD 0= IF
      N @ P @ DUP * MOD 0<> IF 0 EXIT THEN
      BEGIN N @ P @ MOD 0= WHILE  N @ P @ / N !  REPEAT
    THEN
    1 P +!
  REPEAT
  N @ 1 = ;

: MAIN  101 1 DO  I POWERFUL? IF I . THEN  LOOP CR ;
MAIN
