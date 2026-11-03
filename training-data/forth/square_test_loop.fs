: square? ( n -- flag )
  dup 0< if drop false exit then
  0 begin 2dup dup * < 0= while 1+ repeat   \ smallest r with r*r > n
  1-  dup * = ;

: show-squares 30 0 do i square? if i . then loop cr ;
show-squares
