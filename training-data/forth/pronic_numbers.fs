\ Pronic numbers n(n+1)
variable n

: term ( n -- v ) n ! n @ n @ 1 + * ;

: main 10 0 do i term . loop cr ;
main
bye
