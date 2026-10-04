\ Temporarily park values on the return stack with >R and R>.
: SUM3-WITH-HELPER ( a b c -- a+b+c )
  >R + R> + ;

: SWAP-VIA-R ( a b -- b a )
  >R >R
  R> R> SWAP ;

: PEEK-R ( n -- n n ) >R R@ R> ;

: NESTED-INDICES ( -- )
  3 0 DO
    I . ." : "
    2 0 DO
      I . J .
    LOOP
    CR
  LOOP ;

1 2 3 SUM3-WITH-HELPER . CR
1 2 SWAP-VIA-R . . CR
7 PEEK-R . . CR
NESTED-INDICES
