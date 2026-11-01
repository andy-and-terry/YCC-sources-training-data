\ n is triangular iff 8n + 1 is a perfect square.
variable r

: isqrt ( n -- root )
  0 r !
  begin r @ 1+ dup * over <= while 1 r +! repeat
  drop r @ ;

: triangular? ( n -- flag )  8 * 1+ dup isqrt dup * = ;

: main  21 0 do i triangular? if i . then loop cr ;
main bye
