: sigma ( n -- s )
  0 swap dup 1+ 1 ?do
    dup i mod 0= if swap i + swap then
  loop drop ;

: superperfect? ( n -- flag ) dup sigma sigma swap 2* = ;

: show-superperfect 100 1 do i superperfect? if i . then loop cr ;
show-superperfect   \ 2 4 16 64
