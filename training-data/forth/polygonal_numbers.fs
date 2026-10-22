: POLYGONAL ( s n -- p )   \ ((s-2)*n*n - (s-4)*n) / 2
  SWAP >R
  DUP DUP * R@ 2 - *
  SWAP R> 4 - * -
  2 / ;

: .POLYGONALS ( s -- )
  11 1 DO DUP I POLYGONAL . LOOP DROP CR ;

3 .POLYGONALS
5 .POLYGONALS
6 .POLYGONALS
