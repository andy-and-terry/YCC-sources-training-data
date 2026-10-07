VARIABLE SADDR
VARIABLE SLEN
VARIABLE ZL
VARIABLE ZR
VARIABLE ZI
CREATE Z-ARR 64 CELLS ALLOT

: SCHAR ( i -- c ) SADDR @ + C@ ;
: Z@ ( i -- addr ) CELLS Z-ARR + ;

: EXPAND ( i zi -- zi' )
  BEGIN
    DUP OVER 2 PICK + SLEN @ <
    IF OVER SCHAR OVER 2 PICK + SCHAR = ELSE FALSE THEN
  WHILE
    1+
  REPEAT
  NIP ;

: Z-ARRAY ( addr len -- )
  SLEN ! SADDR !
  0 0 Z@ !
  0 ZL ! 0 ZR !
  1 ZI !
  BEGIN
    ZI @ SLEN @ <
  WHILE
    0
    ZI @ ZR @ < IF
      DROP
      ZR @ ZI @ - ZI @ ZL @ - Z@ @ MIN
    THEN
    ZI @ SWAP EXPAND
    DUP ZI @ Z@ !
    ZI @ + ZR @ > IF
      ZI @ ZL !
      ZI @ ZI @ Z@ @ + ZR !
    THEN
    1 ZI +!
  REPEAT ;

S" aabxaabxcaabxaabxay" Z-ARRAY
SLEN @ 0 DO I Z@ @ . LOOP
CR
