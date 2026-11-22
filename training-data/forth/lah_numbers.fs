\ Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
: fact ( n -- n! )  1 swap 1+ 1 ?do i * loop ;
: comb ( n k -- c )  2dup - fact >r fact r> * swap fact swap / ;
: lah ( n k -- l )
  2dup 1- swap 1- swap comb          \ n k C(n-1,k-1)
  >r swap fact r> *                  \ k n!*C
  swap fact / ;

: main  6 1 do 5 i lah . loop cr ;
main
bye
