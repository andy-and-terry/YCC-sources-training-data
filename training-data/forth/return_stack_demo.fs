\ Temporarily stash values on the return stack with >R R@ R>

: SUM-OF-THREE ( a b c -- sum )
  >R + R> + ;

: SQUARE-PLUS-ONE ( n -- n*n+1 )
  DUP >R * R> DROP 1+ ;

: PEEK-COUNTER ( -- )
  3 >R
  R@ . CR
  R> DROP ;

1 2 3 SUM-OF-THREE . CR
5 SQUARE-PLUS-ONE . CR
PEEK-COUNTER
