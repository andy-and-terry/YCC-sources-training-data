\ Primorials up to 1e6, including 1; expect 8.
: prime? ( n -- flag )
  dup 2 < if drop false exit then
  2
  begin
    2dup dup * < if 2drop true exit then
    2dup mod 0= if 2drop false exit then
    1+
  again ;

variable acc
variable cnt
: primorials ( -- n )
  1 acc ! 1 cnt !
  2
  begin
    dup prime? if
      dup acc @ * dup 1000000 > if drop drop cnt @ exit then
      acc ! 1 cnt +!
    then
    1+
  again ;
primorials . cr
bye
