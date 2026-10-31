VARIABLE N
VARIABLE P
VARIABLE DISTINCT

: SPHENIC? ( n -- flag )
  N !  2 P !  0 DISTINCT !
  BEGIN P @ DUP * N @ <= WHILE
    N @ P @ MOD 0= IF
      N @ P @ / N !
      N @ P @ MOD 0= IF 0 EXIT THEN
      1 DISTINCT +!
    THEN
    1 P +!
  REPEAT
  N @ 1 > IF 1 DISTINCT +! THEN
  DISTINCT @ 3 = ;

: MAIN  80 2 DO  I SPHENIC? IF I . THEN  LOOP CR ;
MAIN
