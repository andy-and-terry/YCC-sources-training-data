\ twin primes below 50 by trial division
: prime? ( n -- f )
  dup 2 < if drop 0 exit then
  1 swap dup 2 ?do dup i mod 0= if swap drop 0 swap then loop drop ;
: twins ( -- )  48 3 do i prime? i 2 + prime? and if ." (" i . ." ," i 2 + . ." ) " then loop cr ;
twins
bye
