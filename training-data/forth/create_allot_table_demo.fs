\ A lookup table of squares built with CREATE and ALLOT.
CREATE SQUARES 11 CELLS ALLOT

: FILL-SQUARES ( -- )
  11 0 DO
    I DUP * SQUARES I CELLS + !
  LOOP ;

: SQUARE-OF ( n -- n*n ) CELLS SQUARES + @ ;

\ A constant table using , to compile values.
CREATE PRIMES 2 , 3 , 5 , 7 , 11 , 13 ,

: PRIME-AT ( i -- p ) CELLS PRIMES + @ ;

FILL-SQUARES
7 SQUARE-OF . CR
10 SQUARE-OF . CR
0 PRIME-AT . 5 PRIME-AT . CR

\ Byte table
CREATE VOWELS 5 CHARS ALLOT
CHAR a VOWELS C!  CHAR e VOWELS 1+ C!  CHAR i VOWELS 2 + C!
CHAR o VOWELS 3 + C!  CHAR u VOWELS 4 + C!
VOWELS 5 TYPE CR
