\ Indefinite loops: BEGIN..UNTIL, BEGIN..WHILE..REPEAT, BEGIN..AGAIN

: COUNTDOWN ( n -- )
  BEGIN
    DUP . 1-
    DUP 0=
  UNTIL
  DROP CR ;

: SUM-UNTIL ( limit -- sum )
  0 1 ROT ( sum i limit )
  BEGIN
    2DUP <=
  WHILE
    >R DUP >R + R> 1+ R>
  REPEAT
  2DROP ;

5 COUNTDOWN
10 SUM-UNTIL . CR
