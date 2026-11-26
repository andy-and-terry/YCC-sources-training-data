\ Twin primes below 100; expect 8.
: prime? ( n -- flag )
  dup 2 < if drop false exit then
  2
  begin
    2dup dup * < if 2drop true exit then
    2dup mod 0= if 2drop false exit then
    1+
  again ;

: twins ( -- n ) 0 100 2 do i prime? i 2 + prime? and if 1+ then loop ;
twins . cr
bye
