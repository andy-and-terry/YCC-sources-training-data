CREATE KOL 32 CELLS ALLOT
VARIABLE LEN

: KOL@ ( i -- n )  CELLS KOL + @ ;
: KOL! ( n i -- )  CELLS KOL + ! ;

: KOLAKOSKI ( -- )
  1 0 KOL!  2 1 KOL!  2 2 KOL!
  3 LEN !
  2                              \ i
  BEGIN LEN @ 20 < WHILE
    DUP KOL@                     \ i run
    LEN @ 1- KOL@ 3 SWAP -       \ i run value
    SWAP 0 DO
      DUP LEN @ KOL!
      1 LEN +!
    LOOP
    DROP 1+
  REPEAT
  DROP
  20 0 DO I KOL@ . LOOP CR ;

KOLAKOSKI
