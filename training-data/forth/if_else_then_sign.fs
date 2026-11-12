: sign ( n -- ) dup 0< if drop ." neg" else 0= if ." zero" else ." pos" then then cr ;
-5 sign 0 sign 9 sign
