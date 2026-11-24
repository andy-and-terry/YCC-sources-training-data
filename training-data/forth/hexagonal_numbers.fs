\ Hexagonal numbers: n(2n-1).
: hexagonal ( n -- m )  dup 2* 1- * ;

: main  11 1 do i hexagonal . loop cr ;
main
bye
