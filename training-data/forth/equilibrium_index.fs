\ Equilibrium index: position where the left sum equals the right sum
create nums 1 , 7 , 3 , 6 , 5 , 6 ,
6 constant n
variable total
variable left
variable found

: nums@ ( i -- v ) cells nums + @ ;

: find-equilibrium ( -- index|-1 )
  0 total !  n 0 do i nums@ total +! loop
  0 left !  -1 found !
  n 0 do
    found @ -1 = if
      left @  total @ left @ - i nums@ -  = if i found ! then
    then
    i nums@ left +!
  loop
  found @ ;

find-equilibrium . cr   \ 3
