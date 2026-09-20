: SUM-OF-SQUARES ( a b -- a*a+b*b )
  >R DUP * R> DUP * + ;

: MY-ROT ( a b c -- b c a )
  >R SWAP R> SWAP ;

3 4 SUM-OF-SQUARES . CR
1 2 3 MY-ROT . . . CR
