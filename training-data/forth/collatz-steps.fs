: collatz ( n -- steps )
  0 swap
  begin dup 1 > while
    dup 1 and if 3 * 1+ else 2/ then
    swap 1+ swap
  repeat drop ;

27 collatz . cr
97 collatz . cr
