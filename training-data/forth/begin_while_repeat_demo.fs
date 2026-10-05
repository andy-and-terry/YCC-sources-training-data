: DIGIT-COUNT ( n -- count )
  0 SWAP
  BEGIN DUP 0<> WHILE
    10 /
    SWAP 1+ SWAP
  REPEAT
  DROP ;

: FIRST-POWER-ABOVE ( limit -- p )
  1
  BEGIN 2DUP < 0= WHILE
    2*
  REPEAT
  NIP ;

: COUNTDOWN ( n -- )
  BEGIN
    DUP .
    1-
    DUP 0=
  UNTIL
  DROP ." liftoff" ;

12345 DIGIT-COUNT . CR
100 FIRST-POWER-ABOVE . CR
5 COUNTDOWN CR
