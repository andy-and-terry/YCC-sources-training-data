\ Squarefree numbers up to 100; expect 61.
: squarefree? ( n -- flag )
  2
  begin
    2dup dup * < if 2drop true exit then
    2dup dup * mod 0= if 2drop false exit then
    1+
  again ;
: count-squarefree ( -- n ) 0 101 1 do i squarefree? if 1+ then loop ;
count-squarefree . cr
bye
