\ Lattice paths through an n x n grid using a DP row.
create row 8 cells allot
: lattice ( n -- paths )
  dup 1+ 0 do 1 row i cells + ! loop
  dup 0 do dup 1+ 1 do row i cells + @ row i 1- cells + @ + row i cells + ! loop loop
  cells row + @ ;
3 lattice . cr
