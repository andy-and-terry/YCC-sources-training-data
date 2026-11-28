\ Automorphic: n*n ends with the digits of n
: modulus ( n -- 10^digits ) 10 swap begin dup 10 >= while 10 / swap 10 * swap repeat drop ;

: automorphic? ( n -- flag )
  dup dup * over modulus mod = ;

: show ( -- ) 1000 0 do i automorphic? if i . then loop cr ;
show  \ 0 1 5 6 25 76 376 625
