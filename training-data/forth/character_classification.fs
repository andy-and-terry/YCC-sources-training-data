: DIGIT? ( c -- flag ) [CHAR] 0 [CHAR] 9 1+ WITHIN ;
: UPPER? ( c -- flag ) [CHAR] A [CHAR] Z 1+ WITHIN ;
: LOWER? ( c -- flag ) [CHAR] a [CHAR] z 1+ WITHIN ;

[CHAR] 5 DIGIT? .
[CHAR] A UPPER? .
[CHAR] z LOWER? .
CR
