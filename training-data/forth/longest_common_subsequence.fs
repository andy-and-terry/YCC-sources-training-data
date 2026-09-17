VARIABLE ALEN
VARIABLE BLEN
VARIABLE AADDR
VARIABLE BADDR
VARIABLE COLS
CREATE TABLE 100 CELLS ALLOT

: TCELL ( row col -- addr ) SWAP COLS @ * + CELLS TABLE + ;
: ACHAR ( i -- c ) AADDR @ + C@ ;
: BCHAR ( i -- c ) BADDR @ + C@ ;

: BUILD-LCS ( -- )
  BLEN @ 1+ COLS !
  ALEN @ 1+ 0 DO
    BLEN @ 1+ 0 DO
      I 0= J 0= OR
      IF
        0 J I TCELL !
      ELSE
        J 1- ACHAR I 1- BCHAR =
        IF
          J 1- I 1- TCELL @ 1+ J I TCELL !
        ELSE
          J 1- I TCELL @ J I 1- TCELL @ MAX J I TCELL !
        THEN
      THEN
    LOOP
  LOOP ;

: LCS-LENGTH ( a-addr a-len b-addr b-len -- length )
  BLEN ! BADDR ! ALEN ! AADDR !
  BUILD-LCS
  ALEN @ BLEN @ TCELL @ ;

S" ABCBDAB" S" BDCABA" LCS-LENGTH . CR
