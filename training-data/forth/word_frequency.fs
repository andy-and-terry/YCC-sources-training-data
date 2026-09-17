VARIABLE TADDR
VARIABLE TLEN
VARIABLE WADDR
VARIABLE WLEN
VARIABLE POS
VARIABLE COUNT
VARIABLE TOKSTART
VARIABLE TOKLEN

: TCHAR ( i -- c ) TADDR @ + C@ ;

: SKIP-SPACES ( -- )
  BEGIN
    POS @ TLEN @ <
    IF
      POS @ TCHAR BL =
    ELSE
      FALSE
    THEN
  WHILE
    1 POS +!
  REPEAT ;

: FIND-TOKEN-END ( -- )
  BEGIN
    POS @ TLEN @ <
    IF
      POS @ TCHAR BL <>
    ELSE
      FALSE
    THEN
  WHILE
    1 POS +!
  REPEAT ;

: WORD-FREQUENCY ( text-addr text-len word-addr word-len -- count )
  WLEN ! WADDR ! TLEN ! TADDR !
  0 COUNT !
  0 POS !
  BEGIN
    SKIP-SPACES
    POS @ TLEN @ <
  WHILE
    POS @ TOKSTART !
    FIND-TOKEN-END
    POS @ TOKSTART @ - TOKLEN !
    TADDR @ TOKSTART @ + TOKLEN @ WADDR @ WLEN @ COMPARE 0=
    IF
      1 COUNT +!
    THEN
  REPEAT
  COUNT @ ;

S" the cat sat on the mat the cat ran" S" the" WORD-FREQUENCY . CR
