\ Minimum path through a triangle, bottom-up DP
create tri
  2 , 0 , 0 , 0 ,
  3 , 4 , 0 , 0 ,
  6 , 5 , 7 , 0 ,
  4 , 1 , 8 , 3 ,
create dp 4 cells allot

: cell@ ( r c -- v ) swap 4 * + cells tri + @ ;

: minimum-total ( -- n )
  4 0 do 3 i cell@ dp i cells + ! loop
  -1 2 do                         \ r = 2 down to 0
    i 1+ 0 do
      dp i cells + @  dp i 1+ cells + @  min
      j i cell@ +
      dp i cells + !
    loop
  -1 +loop
  dp @ ;

minimum-total . cr   \ 11
