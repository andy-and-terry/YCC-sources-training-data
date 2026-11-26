: proper-sum ( n -- s ) 0 swap dup 1 ?do dup i mod 0= if swap i + swap then loop drop ;
\ Deficient numbers below 100; expect 76.
: deficients ( -- n ) 0 100 1 do i proper-sum i < if 1+ then loop ;
deficients . cr
bye
