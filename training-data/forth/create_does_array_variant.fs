create squares 5 cells allot
: fill 5 0 do i dup * squares i cells + ! loop ;
fill
: show 5 0 do squares i cells + @ . loop cr ;
show
