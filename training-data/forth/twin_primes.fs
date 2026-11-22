\ Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
variable cand

: prime? ( n -- flag )
  dup 2 < if drop false exit then
  cand !
  true
  cand @ 2 do
    i i * cand @ > if leave then
    cand @ i mod 0= if drop false leave then
  loop ;

: twin? ( p -- flag )  dup prime? swap 2 + prime? and ;

: main  100 2 do i twin? if i . then loop cr ;
main
bye
