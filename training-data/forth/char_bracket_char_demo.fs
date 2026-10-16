\ CHAR reads at interpret time, [CHAR] inside definitions
CHAR A . CR

: LETTER-A ( -- c ) [CHAR] A ;
LETTER-A . CR
LETTER-A EMIT CR

: IS-DIGIT ( c -- f ) DUP [CHAR] 0 >= SWAP [CHAR] 9 <= AND ;
CHAR 7 IS-DIGIT . CR
CHAR x IS-DIGIT . CR
