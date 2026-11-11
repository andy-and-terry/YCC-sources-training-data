\ Perrin sequence P(n)=P(n-2)+P(n-3)
create v 10 cells allot
3 v ! 0 v 1 cells + ! 2 v 2 cells + !

: at ( i -- addr ) cells v + ;
: fill-seq 10 3 do i 2 - at @ i 3 - at @ + i at ! loop ;
: show 10 0 do i at @ . loop cr ;
fill-seq show
bye
