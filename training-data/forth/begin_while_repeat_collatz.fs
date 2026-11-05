\ count Collatz steps
: collatz ( n -- steps )
  0 swap
  begin dup 1 > while
    dup 2 mod if 3 * 1+ else 2 / then
    swap 1+ swap
  repeat drop ;
27 collatz .
