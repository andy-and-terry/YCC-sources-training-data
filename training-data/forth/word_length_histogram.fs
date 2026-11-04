create counts 10 cells allot
counts 10 cells erase

: bump ( len -- ) 9 min cells counts + 1 swap +! ;

: tally ( c-addr u -- )
  0 -rot bounds do
    i c@ bl = if dup if bump 0 then else 1+ then
  loop dup if bump else drop then ;

s" the quick brown fox jumps over the lazy dog" tally
: show 10 1 do i . ." : " i cells counts + @ . cr loop ;
show
