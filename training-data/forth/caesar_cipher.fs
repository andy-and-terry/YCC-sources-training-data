\ Caesar cipher over a string buffer, in place

: ROTATE-CHAR ( c key base -- c' )
  >R SWAP R@ - + 26 MOD R> + ;

: SHIFT-CHAR ( c key -- c' )
  OVER [CHAR] a [CHAR] z 1+ WITHIN IF [CHAR] a ROTATE-CHAR EXIT THEN
  OVER [CHAR] A [CHAR] Z 1+ WITHIN IF [CHAR] A ROTATE-CHAR EXIT THEN
  DROP ;

: CAESAR ( c-addr u key -- )
  -ROT OVER + SWAP DO
    I C@ OVER SHIFT-CHAR I C!
  LOOP DROP ;

CREATE MSG 13 ALLOT
S" Hello, World!" MSG SWAP CMOVE

MSG 13 3 CAESAR
MSG 13 TYPE CR
MSG 13 -3 CAESAR
MSG 13 TYPE CR
