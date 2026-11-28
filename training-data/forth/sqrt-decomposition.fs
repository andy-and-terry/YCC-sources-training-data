create a 5 , 3 , 8 , 1 , 9 , 2 , 7 , 4 , 6 , 0 , 3 , 5 ,
create blk 3 cells allot
: init blk 3 cells erase 12 0 do a i cells + @ i 4 / cells blk + +! loop ;
: query ( l r -- sum )
  0 { l r s }
  l begin dup r <= while
    dup 4 mod 0= over 3 + r <= and
    if dup 4 / cells blk + @ s + to s 4 +
    else dup cells a + @ s + to s 1+ then
  repeat drop s ;
init 2 9 query . cr
