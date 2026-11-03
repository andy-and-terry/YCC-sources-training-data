: digit-square-sum ( n -- sum )
  abs 0 swap
  begin dup 0> while
    10 /mod swap dup * rot + swap
  repeat drop ;

123 digit-square-sum . cr
-99 digit-square-sum . cr
