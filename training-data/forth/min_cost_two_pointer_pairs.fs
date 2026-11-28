\ Count pairs (i<j) in an array whose sum equals a target, using sorted two pointers
create sorted 1 , 2 , 4 , 5 , 6 , 9 ,
6 constant n
variable lo
variable hi
variable pairs

: s@ ( i -- v ) cells sorted + @ ;

: count-pairs ( target -- n )
  0 lo !  n 1- hi !  0 pairs !
  begin lo @ hi @ < while
    lo @ s@ hi @ s@ +  over =
    if 1 pairs +!  1 lo +!  -1 hi +!
    else lo @ s@ hi @ s@ + over < if 1 lo +! else -1 hi +! then
    then
  repeat
  drop pairs @ ;

10 count-pairs . cr   \ 2  (1+9, 4+6)
