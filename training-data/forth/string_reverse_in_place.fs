\ Reverse a string in place by swapping bytes from both ends

CREATE WORD-BUF 5 ALLOT
S" hello" WORD-BUF SWAP CMOVE

: SWAP-BYTES ( a1 a2 -- )
  2DUP C@ SWAP C@ ROT C! SWAP C! ;

: FLIP ( c-addr u -- )
  1- OVER + SWAP           \ end start
  BEGIN 2DUP > WHILE
    2DUP SWAP-BYTES
    1+ SWAP 1- SWAP
  REPEAT 2DROP ;

WORD-BUF 5 FLIP
WORD-BUF 5 TYPE CR
