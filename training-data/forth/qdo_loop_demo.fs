\ ?DO skips the loop body entirely when limit equals start
: COUNT-UP ( n -- )  0 ?DO I . LOOP CR ;

3 COUNT-UP
0 COUNT-UP

: SUM-RANGE ( lo hi -- sum )
  0 -ROT SWAP ?DO I + LOOP ;

1 6 SUM-RANGE . CR
5 5 SUM-RANGE . CR

\ Counting down with a negative step
: COUNTDOWN ( n -- )  0 SWAP ?DO I . -1 +LOOP CR ;
5 COUNTDOWN
