\ Amicable pairs below 1500 via sums of proper divisors.
variable acc

: sum-div ( n -- sum )
  0 acc !
  dup 1 ?do dup i mod 0= if i acc +! then loop
  drop acc @ ;

: amicable ( -- )
  1500 2 do
    i sum-div dup i > if
      dup sum-div i = if i . dup . cr then
    then
    drop
  loop ;

amicable
bye
