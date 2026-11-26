\ Emirps below 200; expect 15.
: prime? ( n -- flag )
  dup 2 < if drop false exit then
  2
  begin
    2dup dup * < if 2drop true exit then
    2dup mod 0= if 2drop false exit then
    1+
  again ;

: rev ( n -- r ) 0 swap begin dup 0> while 10 /mod >r 10 * r> + swap repeat drop ;
: emirp? ( n -- flag ) dup rev 2dup = if 2drop drop false exit then swap prime? swap prime? and ;
: emirps ( -- n ) 0 200 2 do i emirp? if 1+ then loop ;
emirps . cr
bye
