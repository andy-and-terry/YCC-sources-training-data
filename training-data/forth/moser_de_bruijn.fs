\ Moser-de Bruijn sequence: binary digits of n read in base 4.
: moser ( n -- m )
  dup 0= if exit then
  dup 1 and swap 2/ recurse 4 * + ;

: main  12 0 do i moser . loop cr ;
main
bye
