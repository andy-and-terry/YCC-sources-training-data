\ BEGIN ... UNTIL, BEGIN ... WHILE ... REPEAT, and +LOOP

: COUNTDOWN ( n -- )
  BEGIN
    DUP .
    1-
    DUP 0=
  UNTIL
  DROP CR ;

: HALVINGS ( n -- )
  BEGIN
    DUP 1 >
  WHILE
    DUP .
    2/
  REPEAT
  . CR ;

: EVENS ( limit -- )
  0 DO I . 2 +LOOP CR ;

5 COUNTDOWN
100 HALVINGS
11 EVENS
