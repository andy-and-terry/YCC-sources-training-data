\ Sophie Germain primes: p prime and 2p + 1 prime.
variable cand

: prime? ( n -- flag )
  dup 2 < if drop false exit then
  cand !
  true
  cand @ 2 do
    i i * cand @ > if leave then
    cand @ i mod 0= if drop false leave then
  loop ;

: sophie? ( p -- flag )  dup prime? swap 2* 1+ prime? and ;

: main  100 2 do i sophie? if i . then loop cr ;
main
bye
