VARIABLE AADDR
VARIABLE ALEN
VARIABLE BADDR
VARIABLE BLEN
VARIABLE BEST-LEN
VARIABLE BEST-END
CREATE DP 32 32 * CELLS ALLOT

: ACHAR ( i -- c ) AADDR @ + C@ ;
: BCHAR ( i -- c ) BADDR @ + C@ ;
: DP@ ( row col -- addr ) 32 * + CELLS DP + ;

: LONGEST-COMMON-SUBSTRING ( a-addr a-len b-addr b-len -- len )
  BLEN ! BADDR ! ALEN ! AADDR !
  0 BEST-LEN !
  ALEN @ 1+ 0 DO 0 0 I DP@ ! LOOP
  BLEN @ 1+ 0 DO 0 I 0 DP@ ! LOOP
  ALEN @ 1 DO
    BLEN @ 1 DO
      I 1- ACHAR J 1- BCHAR = IF
        I 1- J 1- DP@ @ 1+
        DUP I J DP@ !
        BEST-LEN @ MAX BEST-LEN !
      ELSE
        0 I J DP@ !
      THEN
    LOOP
  LOOP
  BEST-LEN @ ;

S" abcdefg" S" xyzabcq" LONGEST-COMMON-SUBSTRING . CR
