\ Using the return stack with >R, R> and R@

: SWAP-VIA-RSTACK ( a b -- b a )
  >R >R R> R> SWAP ;

: THIRD-OVER ( a b c -- a b c a )
  >R OVER R> SWAP ;

: SUM3 ( a b c -- sum )
  >R + R> + ;

: DOUBLE-KEEP ( n -- n n*2 )
  DUP >R 2* R> SWAP ;

: PEEK-COUNT ( -- )
  3 >R
  R@ . R@ 1+ . 
  R> DROP CR ;

1 2 SWAP-VIA-RSTACK . . CR
1 2 3 SUM3 . CR
5 DOUBLE-KEEP . . CR
PEEK-COUNT
