\ Armstrong numbers below 1000 (3-digit case uses cubes, shorter use own length)
: digit-count ( n -- k ) dup 100 >= if drop 3 else 10 >= if 2 else 1 then then ;

: power ( b e -- b^e ) 1 swap 0 ?do over * loop nip ;

: armstrong? ( n -- flag )
  dup digit-count >r
  dup 0 swap
  begin dup 0> while
    10 /mod swap  ( total rest digit )
    r@ power
    rot + swap
  repeat drop
  r> drop = ;

: show ( -- ) 1000 1 do i armstrong? if i . then loop cr ;
show  \ 1 2 3 4 5 6 7 8 9 153 370 371 407
