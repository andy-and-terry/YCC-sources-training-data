\ Pronic numbers n*(n+1) and a test using integer search for n
: pronic ( n -- n*(n+1) ) dup 1+ * ;

: pronic? ( x -- flag )
  0
  begin 2dup pronic < while 1+ repeat
  pronic = ;

: first-ten ( -- ) 10 0 do i pronic . loop cr ;
first-ten    \ 0 2 6 12 20 30 42 56 72 90
56 pronic? . \ -1 (true)
57 pronic? . \ 0
