VARIABLE ALEN
VARIABLE BLEN
VARIABLE AADDR
VARIABLE BADDR
VARIABLE COLS
CREATE TABLE 100 CELLS ALLOT

: TCELL ( row col -- addr ) SWAP COLS @ * + CELLS TABLE + ;
: ACHAR ( i -- c ) AADDR @ + C@ ;
: BCHAR ( i -- c ) BADDR @ + C@ ;
: MIN3 ( a b c -- min ) ROT MIN MIN ;

: BUILD-TABLE ( -- )
  BLEN @ 1+ COLS !
  ALEN @ 1+ 0 DO
    BLEN @ 1+ 0 DO
      I 0=
      IF
        J J I TCELL !
      ELSE
        J 0=
        IF
          I J I TCELL !
        ELSE
          J 1- ACHAR I 1- BCHAR =
          IF
            J 1- I 1- TCELL @ J I TCELL !
          ELSE
            J 1- I TCELL @ 1+
            J I 1- TCELL @ 1+
            J 1- I 1- TCELL @ 1+
            MIN3
            J I TCELL !
          THEN
        THEN
      THEN
    LOOP
  LOOP ;

: EDIT-DISTANCE ( a-addr a-len b-addr b-len -- distance )
  BLEN ! BADDR ! ALEN ! AADDR !
  BUILD-TABLE
  ALEN @ BLEN @ TCELL @ ;

S" horse" S" ros" EDIT-DISTANCE . CR
