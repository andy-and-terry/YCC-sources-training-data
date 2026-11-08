: popcount ( n -- k )
  0 swap
  begin dup while
    dup 1 and rot + swap 1 rshift
  repeat drop ;

255 popcount . cr
1024 popcount . cr
