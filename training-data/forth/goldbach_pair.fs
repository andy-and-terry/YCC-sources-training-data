\ Goldbach pair for an even number.
: prime? ( n -- f )
  dup 2 < if drop false exit then
  true swap dup 2 ?do
    i i * over > if leave then
    dup i mod 0= if swap drop false swap leave then
  loop drop ;
: goldbach ( n -- p q )
  dup 2/ 1+ 2 do
    i prime? over i - prime? and if i over i - rot drop unloop exit then
  loop 0 0 ;
28 goldbach . . cr
