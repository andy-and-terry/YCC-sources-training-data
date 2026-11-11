\ Square pyramidal numbers n(n+1)(2n+1)/6
variable n

: term ( n -- v ) n ! n @ n @ 1 + * 2 n @ * 1 + * 6 / ;

: main 10 0 do i term . loop cr ;
main
bye
