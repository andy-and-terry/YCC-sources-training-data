\ Stern's diatomic sequence, memoised in an array
create seq 15 cells allot
0 seq !
1 seq cell+ !

: s@ ( i -- v ) cells seq + @ ;
: s! ( v i -- ) cells seq + ! ;

: fill-seq ( -- )
  15 2 do
    i 2 mod 0= if i 2/ s@ else i 2/ s@ i 2/ 1+ s@ + then
    i s!
  loop ;

: show ( -- ) fill-seq 15 0 do i s@ . loop cr ;
show  \ 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
