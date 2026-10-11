\ LSHIFT and RSHIFT as multiply/divide by powers of two
: SHOW ( n u -- )
  2DUP SWAP . ." << " . ." = " LSHIFT . CR ;

3 1 SHOW
3 4 SHOW
1 10 SHOW

: HALVE ( n -- n/2 ) 1 RSHIFT ;
100 HALVE . CR
255 4 RSHIFT . CR
