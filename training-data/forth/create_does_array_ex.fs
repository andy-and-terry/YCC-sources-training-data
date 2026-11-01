: array create cells allot does> swap cells + ;
5 array squares
: fill 5 0 do i i * i squares ! loop ;
fill
: show 5 0 do i squares @ . loop cr ;
show
