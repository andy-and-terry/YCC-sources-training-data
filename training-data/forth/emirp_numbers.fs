\ Emirps: primes whose digit reversal is a different prime
variable cand

: prime? ( n -- flag )
  dup 2 < if drop false exit then
  cand ! true
  cand @ 2 ?do
    cand @ i mod 0= if drop false leave then
  loop ;

: reverse-digits ( n -- r )
  0 swap
  begin dup while
    10 /mod -rot swap 10 * + swap
  repeat drop ;

: emirps ( -- )
  100 2 do
    i reverse-digits dup i <> if
      dup prime? i prime? and if i . then
    then drop
  loop cr ;

emirps
