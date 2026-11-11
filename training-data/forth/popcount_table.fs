\ Population count (number of set bits) for 0..15
: bits ( n -- count )
  0 swap
  begin dup while
    dup 1 and rot + swap 1 rshift
  repeat drop ;

: main 16 0 do i bits . loop cr ;
main
bye
