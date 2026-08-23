: DOUBLE ( n -- n*2 ) 2 * ;
: TRIPLE ( n -- n*3 ) 3 * ;
: QUADRUPLE ( n -- n*4 ) DOUBLE DOUBLE ;

5 DOUBLE .
5 TRIPLE .
5 QUADRUPLE .
CR
