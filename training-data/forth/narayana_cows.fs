\ Narayana's cows N(n)=N(n-1)+N(n-3)
create v 10 cells allot
1 v ! 1 v 1 cells + ! 1 v 2 cells + !

: at ( i -- addr ) cells v + ;
: fill-seq 10 3 do i 1 - at @ i 3 - at @ + i at ! loop ;
: show 10 0 do i at @ . loop cr ;
fill-seq show
bye
