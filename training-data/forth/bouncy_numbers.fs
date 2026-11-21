\ Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
variable inc
variable dec

: bouncy? ( n -- flag )
  -1 inc ! -1 dec !
  0 <# #s #>                       \ addr u
  1 ?do
    dup i + c@                     \ addr cur
    over i + 1- c@                 \ addr cur prev
    2dup < if 0 inc ! then         \ digit went down: not non-decreasing
    2dup > if 0 dec ! then         \ digit went up: not non-increasing
    2drop
  loop
  drop
  inc @ 0= dec @ 0= and ;

: count-bouncy ( -- n )
  0 1000 1 do i bouncy? if 1+ then loop ;

count-bouncy . cr
bye
