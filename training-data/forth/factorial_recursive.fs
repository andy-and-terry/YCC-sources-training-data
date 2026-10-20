: fact ( n -- n! ) dup 2 < if drop 1 else dup 1- recurse * then ;
5 fact . cr
