\ Counting version of bead sort: tally values 1..5, then print in order.
create tally 6 cells allot  tally 6 cells erase
: add ( n -- ) cells tally + 1 swap +! ;
: show  6 1 do i cells tally + @ 0 ?do j . loop loop cr ;
5 add 3 add 1 add 4 add 2 add show
