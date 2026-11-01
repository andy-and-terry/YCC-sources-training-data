\ Leyland numbers: x^y + y^x for x >= y >= 2.
: ipow ( base exp -- n )  1 swap 0 ?do over * loop nip ;
: leyland ( x y -- n )  2dup ipow >r swap ipow r> + ;

: main
  5 2 do
    i 1+ 2 do
      j i leyland .
    loop
  loop cr ;
main bye
