\ Amicable pairs: d(a) = b and d(b) = a with a <> b
: d ( n -- sum )
  0 swap
  dup 1 ?do
    dup i mod 0= if swap i + swap then
  loop drop ;

: amicable ( limit -- )
  2 do
    i d dup i > if
      dup d i = if i . dup . cr then
    then drop
  loop ;

1500 amicable
