: sum3 ( a b c -- s ) >r + r> + ;
1 2 3 sum3 . cr
: twice-r ( n -- n n ) dup >r r> ;
7 twice-r . . cr
