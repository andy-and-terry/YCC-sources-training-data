\ rotate three items using the return stack
: MY-ROT ( a b c -- b c a )
  >R SWAP R> SWAP ;

: DEMO
  1 2 3 MY-ROT . . . CR ;

DEMO
