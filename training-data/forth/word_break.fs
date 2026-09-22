CREATE DP 20 CELLS ALLOT
VARIABLE SADDR
VARIABLE SLEN

: DP-ADDR ( i -- addr ) CELLS DP + ;

: IN-DICT? ( addr len -- flag )
  2DUP S" leet" COMPARE 0=
  IF 2DROP TRUE EXIT THEN
  S" code" COMPARE 0= ;

: WORD-BREAK ( addr len -- flag )
  SLEN ! SADDR !
  TRUE 0 DP-ADDR !
  SLEN @ 1+ 1 DO
    FALSE I DP-ADDR !
    I 0 DO
      I DP-ADDR @ IF
        SADDR @ I + J I - IN-DICT? IF
          TRUE J DP-ADDR !
        THEN
      THEN
    LOOP
  LOOP
  SLEN @ DP-ADDR @ ;

S" leetcode" WORD-BREAK .
S" leetcodex" WORD-BREAK .
CR
