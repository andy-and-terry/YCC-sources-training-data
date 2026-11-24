\ Pentagonal numbers: n(3n-1)/2.
: pentagonal ( n -- m )  dup 3 * 1- * 2/ ;

: main  11 1 do i pentagonal . loop cr ;
main
bye
