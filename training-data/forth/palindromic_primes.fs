\ Palindromic primes below 200
: prime? ( n -- flag )
  dup 2 < if drop false exit then
  true swap
  dup 2 ?do
    dup i i * < if leave then
    dup i mod 0= if swap drop false swap leave then
  loop drop ;

: reverse-digits ( n -- r )
  0 swap
  begin dup 0> while
    10 /mod swap rot 10 * + swap
  repeat drop ;

: palindrome? ( n -- flag ) dup reverse-digits = ;

: show ( -- ) 200 2 do i palindrome? if i prime? if i . then then loop cr ;
show  \ 2 3 5 7 11 101 131 151 181 191
