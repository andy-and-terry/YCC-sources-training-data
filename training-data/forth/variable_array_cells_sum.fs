create arr 5 cells allot
: fill 5 0 do i 10 * arr i cells + ! loop ;
: sum 0 5 0 do arr i cells + @ + loop ;
fill sum . cr
