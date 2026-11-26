\ Goldbach partitions of 100; expect 6.
: prime? ( n -- flag )
  dup 2 < if drop false exit then
  2
  begin
    2dup dup * < if 2drop true exit then
    2dup mod 0= if 2drop false exit then
    1+
  again ;

: goldbach ( -- n ) 0 51 2 do i prime? 100 i - prime? and if 1+ then loop ;
goldbach . cr
bye
