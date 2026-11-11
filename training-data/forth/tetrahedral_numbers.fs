\ Tetrahedral numbers n(n+1)(n+2)/6
variable n

: term ( n -- v ) n ! n @ n @ 1 + * n @ 2 + * 6 / ;

: main 10 0 do i term . loop cr ;
main
bye
