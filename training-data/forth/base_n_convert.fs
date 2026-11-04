\ Forth has a BASE variable; the number printer honours it.
: .in-base ( n base -- ) base @ >r base ! . r> base ! ;

: demo
  255 2 .in-base
  255 8 .in-base
  255 16 .in-base
  255 36 .in-base cr ;
demo
