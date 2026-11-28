\ Emirps below 200: prime whose digit reversal is a different prime
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

: emirp? ( p -- flag )
  dup prime? 0= if drop false exit then
  dup reverse-digits 2dup = if 2drop false exit then
  nip prime? ;

: show ( -- ) 200 2 do i emirp? if i . then loop cr ;
show  \ 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
