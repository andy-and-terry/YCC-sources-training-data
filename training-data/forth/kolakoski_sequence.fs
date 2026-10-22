CREATE KOL 24 CELLS ALLOT
VARIABLE W
VARIABLE V

: KOL@ ( i -- n )  CELLS KOL + @ ;
: KOL! ( n i -- )  CELLS KOL + ! ;
: PUT ( -- )  V @ W @ KOL!  1 W +! ;

: KOLAKOSKI ( -- )
  1 0 KOL!  2 1 KOL!  2 2 KOL!
  3 W !  1 V !
  2                              \ read index
  BEGIN W @ 20 < WHILE
    DUP KOL@ 0 DO PUT LOOP
    3 V @ - V !
    1+
  REPEAT
  DROP
  20 0 DO I KOL@ . LOOP CR ;

KOLAKOSKI
