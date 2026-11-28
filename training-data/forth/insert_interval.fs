\ Insert [2,5] into sorted intervals [1,3] [6,9]
create ivs 1 , 3 , 6 , 9 ,
2 constant count
variable nlo
variable nhi
variable placed

: lo@ ( i -- v ) 2* cells ivs + @ ;
: hi@ ( i -- v ) 2* 1+ cells ivs + @ ;
: .iv ( lo hi -- ) ." [" swap . ." ," . ." ] " ;

: insert-interval ( lo hi -- )
  nhi ! nlo !  false placed !
  count 0 do
    i hi@ nlo @ < if
      i lo@ i hi@ .iv
    else i lo@ nhi @ > if
      placed @ 0= if nlo @ nhi @ .iv true placed ! then
      i lo@ i hi@ .iv
    else
      i lo@ nlo @ min nlo !
      i hi@ nhi @ max nhi !
    then then
  loop
  placed @ 0= if nlo @ nhi @ .iv then
  cr ;

2 5 insert-interval   \ [1,5] [6,9]
