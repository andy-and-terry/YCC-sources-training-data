: sign ( n -- ) dup 0< if drop ." negative" else 0= if ." zero" else ." positive" then then cr ;
-5 sign
0 sign
7 sign
