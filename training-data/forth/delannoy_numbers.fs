\ D(m, n) = D(m-1, n) + D(m, n-1) + D(m-1, n-1)
: delannoy ( m n -- d )
  over 0= if 2drop 1 exit then
  dup 0= if 2drop 1 exit then
  2dup 1- delannoy >r
  2dup swap 1- swap delannoy >r
  1- swap 1- swap delannoy
  r> + r> + ;

: central ( n -- d ) dup delannoy ;

: show-delannoy 6 0 do i central . loop cr ;
show-delannoy   \ 1 3 13 63 321 1683
