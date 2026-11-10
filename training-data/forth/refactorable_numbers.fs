: tau ( n -- count )
  0 swap dup 1+ 1 ?do
    dup i mod 0= if swap 1+ swap then
  loop drop ;

: refactorable? ( n -- flag ) dup tau mod 0= ;

: show-refactorable 60 1 do i refactorable? if i . then loop cr ;
show-refactorable   \ 1 2 8 9 12 18 24 36 40 56
