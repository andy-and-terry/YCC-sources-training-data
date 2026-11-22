\ Emirps: primes whose digit reversal is a different prime.
variable cand
variable rev

: prime? ( n -- flag )
  dup 2 < if drop false exit then
  cand !
  true                                   \ flag
  cand @ 2 do
    i i * cand @ > if leave then         \ stop once d*d > n
    cand @ i mod 0= if drop false leave then
  loop ;

: reverse-num ( n -- r )
  0 rev !
  begin dup 0> while
    10 /mod                              \ digit quotient
    swap rev @ 10 * + rev !
  repeat drop
  rev @ ;

: emirp? ( n -- flag )
  dup reverse-num                        \ n r
  2dup = if 2drop false exit then
  swap prime? swap prime? and ;

: main  200 2 do i emirp? if i . then loop cr ;
main
bye
