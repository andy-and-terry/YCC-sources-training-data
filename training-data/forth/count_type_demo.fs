\ Counted strings: length byte followed by characters
CREATE GREETING 5 C, CHAR h C, CHAR e C, CHAR l C, CHAR l C, CHAR o C,

GREETING COUNT TYPE CR
GREETING C@ . CR

: SHOUT ( c-addr -- ) COUNT 0 DO DUP I + C@ [CHAR] a - [CHAR] A + EMIT LOOP DROP CR ;
GREETING SHOUT
