\ Lazy caterer sequence: max pieces from n cuts
variable n

: term ( n -- v ) n ! n @ n @ 1 + * 2 / 1 + ;

: main 10 0 do i term . loop cr ;
main
bye
