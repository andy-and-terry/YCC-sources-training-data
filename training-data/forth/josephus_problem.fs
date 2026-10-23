\ Josephus problem: every k-th person in a circle of n is eliminated.

CREATE RING 64 CELLS ALLOT
VARIABLE CNT
VARIABLE POS
VARIABLE KK

: RING@ ( i -- v ) CELLS RING + @ ;
: RING! ( v i -- ) CELLS RING + ! ;

\ Print the elimination order by shifting the array left after each removal.
: SIMULATE ( n k -- )
  KK ! DUP CNT !
  0 DO I 1+ I RING! LOOP
  0 POS !
  BEGIN CNT @ 0> WHILE
    POS @ KK @ 1- + CNT @ MOD POS !
    POS @ RING@ .
    CNT @ 1- POS @ ?DO I 1+ RING@ I RING! LOOP
    -1 CNT +!
  REPEAT
  CR ;

\ Closed recurrence: J(1)=0, J(i)=(J(i-1)+k) mod i.
: SURVIVOR ( n k -- s )
  KK ! 0 SWAP 1+ 2 ?DO KK @ + I MOD LOOP 1+ ;

." Elimination order (n=7, k=3): " 7 3 SIMULATE
." Survivor (n=7, k=3): " 7 3 SURVIVOR . CR
." Survivor (n=41, k=3): " 41 3 SURVIVOR . CR
