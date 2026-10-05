\ Fast doubling: F(2k) = F(k) * (2F(k+1) - F(k)), F(2k+1) = F(k)^2 + F(k+1)^2
: FIB2 { n -- fn fn+1 }
  n 0= IF 0 1 EXIT THEN
  n 2/ RECURSE { a b }
  a b 2* a - *            \ c = F(2k)
  a DUP * b DUP * +       \ d = F(2k+1)
  n 1 AND IF SWAP OVER + THEN ;

: FIB ( n -- f ) FIB2 DROP ;

10 FIB . CR
50 FIB . CR
90 FIB . CR
