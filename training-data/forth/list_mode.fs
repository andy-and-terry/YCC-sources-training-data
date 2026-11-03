create counts 10 cells allot
counts 10 cells erase

: tally ( n -- ) cells counts + 1 swap +! ;
: max-count ( -- n ) 0 10 0 do counts i cells + @ max loop ;

1 tally 2 tally 2 tally 3 tally 3 tally 4 tally

max-count
10 0 do
  dup counts i cells + @ = if i . then
loop
drop cr
