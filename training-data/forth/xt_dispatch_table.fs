: OP-ADD ( a b -- n ) + ;
: OP-SUB ( a b -- n ) - ;
: OP-MUL ( a b -- n ) * ;

CREATE OPS 3 CELLS ALLOT
' OP-ADD OPS 0 CELLS + !
' OP-SUB OPS 1 CELLS + !
' OP-MUL OPS 2 CELLS + !

: DISPATCH ( a b op-index -- n )
  CELLS OPS + @ EXECUTE ;

10 4 0 DISPATCH .
10 4 1 DISPATCH .
10 4 2 DISPATCH .
CR
