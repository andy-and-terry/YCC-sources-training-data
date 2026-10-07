\ Sum of cubes from 1 to n

: CUBE ( n -- n^3 ) DUP DUP * * ;

: SUM-OF-CUBES ( n -- sum )
  0 SWAP 1+ 1 DO I CUBE + LOOP ;

\ closed form: (n(n+1)/2)^2
: SUM-OF-CUBES-FORMULA ( n -- sum )
  DUP 1+ * 2/ DUP * ;

10 SUM-OF-CUBES . CR
10 SUM-OF-CUBES-FORMULA . CR
