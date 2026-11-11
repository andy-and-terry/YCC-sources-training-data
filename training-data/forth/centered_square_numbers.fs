\ Centered square numbers 2n(n+1)+1
variable n

: term ( n -- v ) n ! 2 n @ * n @ 1 + * 1 + ;

: main 10 0 do i term . loop cr ;
main
bye
