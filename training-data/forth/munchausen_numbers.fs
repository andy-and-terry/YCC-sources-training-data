\ Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
variable tot

: dpow ( d -- d^d )
  dup 0= if exit then
  dup 1 swap 0 ?do over * loop nip ;

: munchausen? ( n -- flag )
  0 tot ! dup
  begin dup 0> while
    10 /mod swap dpow tot +!
  repeat
  drop tot @ = ;

: show-munchausen ( -- )
  5000 1 do i munchausen? if i . then loop cr ;

show-munchausen
bye
