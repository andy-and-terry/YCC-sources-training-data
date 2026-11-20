\ Wilson's theorem primality test.
: wilson? ( n -- f )
  dup 2 < if drop false exit then
  1 over 2 ?do i * over mod loop swap 1- = ;
: show  20 2 do i wilson? if i . then loop cr ;
show
