: ROT-LIKE ( a b c -- b c a ) >R SWAP R> SWAP ;

: OVER-VIA-R ( a b -- a b a ) >R DUP R> SWAP ;

: SQUARE-AND-ADD ( a b -- a*a+b ) >R DUP * R> + ;

: PEEK-TWICE ( n -- n+n ) >R R@ R> + ;

1 2 3 ROT-LIKE . . . CR
10 20 OVER-VIA-R . . . CR
5 3 SQUARE-AND-ADD . CR
21 PEEK-TWICE . CR
