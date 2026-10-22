CREATE SEEN 256 CELLS ALLOT
SEEN 256 CELLS ERASE

: SEEN? ( n -- flag )  CELLS SEEN + @ ;
: SEEN! ( n -- )  TRUE SWAP CELLS SEEN + ! ;

: NEXT-TERM ( prev i -- next )
  2DUP -                       \ prev i c
  DUP 0> IF
    DUP SEEN? 0= IF NIP NIP EXIT THEN
  THEN
  DROP + ;

: RECAMAN ( count -- )
  0 DUP SEEN! DUP .
  SWAP 1 DO
    I NEXT-TERM DUP SEEN! DUP .
  LOOP
  DROP CR ;

20 RECAMAN
