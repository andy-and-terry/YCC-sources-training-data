\ Printing and manipulating strings

: GREET ( -- ) ." Hello, Forth!" CR ;

: SHOW-STR ( c-addr u -- )
  TYPE CR ;

: SHOUT ( c-addr u -- )
  0 ?DO
    DUP I + C@
    DUP [CHAR] a [CHAR] z 1+ WITHIN IF 32 - THEN
    EMIT
  LOOP
  DROP CR ;

: COUNT-SPACES ( c-addr u -- n )
  0 SWAP 0 ?DO
    OVER I + C@ BL = IF 1+ THEN
  LOOP
  NIP ;

GREET
S" plain string" SHOW-STR
S" shout me" SHOUT
S" abc" NIP . CR
[CHAR] A EMIT CR
S" one two three" COUNT-SPACES . CR
