VARIABLE PADDR
VARIABLE PLEN
VARIABLE TADDR
VARIABLE TLEN
VARIABLE TI
VARIABLE PJ
VARIABLE MATCH-POS
VARIABLE LEN-VAR
VARIABLE I-VAR
CREATE LPS-ARR 32 CELLS ALLOT

: LPS-ADDR ( i -- addr ) CELLS LPS-ARR + ;
: PCHAR ( i -- c ) PADDR @ + C@ ;
: TCHAR ( i -- c ) TADDR @ + C@ ;

: BUILD-LPS ( -- )
  0 LEN-VAR !
  0 0 LPS-ADDR !
  1 I-VAR !
  BEGIN
    I-VAR @ PLEN @ <
  WHILE
    I-VAR @ PCHAR LEN-VAR @ PCHAR =
    IF
      1 LEN-VAR +!
      I-VAR @ LPS-ADDR LEN-VAR @ SWAP !
      1 I-VAR +!
    ELSE
      LEN-VAR @ 0<>
      IF
        LEN-VAR @ 1- LPS-ADDR @ LEN-VAR !
      ELSE
        I-VAR @ LPS-ADDR 0 SWAP !
        1 I-VAR +!
      THEN
    THEN
  REPEAT ;

: KMP-SEARCH ( pattern-addr pattern-len text-addr text-len -- pos )
  TLEN !
  TADDR !
  PLEN !
  PADDR !
  BUILD-LPS
  0 TI !
  0 PJ !
  -1 MATCH-POS !
  BEGIN
    MATCH-POS @ -1 =
    TI @ TLEN @ < AND
  WHILE
    TI @ TCHAR PJ @ PCHAR =
    IF
      1 TI +!
      1 PJ +!
      PJ @ PLEN @ =
      IF
        TI @ PLEN @ - MATCH-POS !
      THEN
    ELSE
      PJ @ 0<>
      IF
        PJ @ 1- LPS-ADDR @ PJ !
      ELSE
        1 TI +!
      THEN
    THEN
  REPEAT
  MATCH-POS @ ;

S" AB" S" XXABXX" KMP-SEARCH . CR
S" XYZ" S" ABCDEF" KMP-SEARCH . CR
