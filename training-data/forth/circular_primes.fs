\ Circular primes below 100: one- and two-digit rotations; expect 13.
: prime? ( n -- flag )
  dup 2 < if drop false exit then
  2
  begin
    2dup dup * < if 2drop true exit then
    2dup mod 0= if 2drop false exit then
    1+
  again ;

: rot2 ( n -- r ) 10 /mod swap 10 * + ;
: circular? ( n -- flag )
  dup 10 < if prime? exit then
  dup prime? swap rot2 prime? and ;
: circulars ( -- n ) 0 100 2 do i circular? if 1+ then loop ;
circulars . cr
bye
