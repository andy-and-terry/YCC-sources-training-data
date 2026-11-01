: fizz?  3 mod 0= ;
: buzz?  5 mod 0= ;
: fb ( n -- )
  dup fizz? over buzz? and if drop ." FizzBuzz" exit then
  dup fizz? if drop ." Fizz" exit then
  dup buzz? if drop ." Buzz" exit then
  . ;
: run 16 1 do i fb cr loop ;
run
