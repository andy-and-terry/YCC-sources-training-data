\ Fibonacci with a memo table; 0 means "not computed yet"
50 CONSTANT MAX
CREATE MEMO MAX 1+ CELLS ALLOT
MEMO MAX 1+ CELLS ERASE

: MEMO@ ( n -- addr ) CELLS MEMO + ;

: FIB ( n -- fib )
  DUP 2 < IF EXIT THEN
  DUP MEMO@ @ ?DUP IF NIP EXIT THEN
  DUP 1- RECURSE OVER 2 - RECURSE +
  DUP ROT MEMO@ ! ;

10 FIB . CR
30 FIB . CR
45 FIB . CR
