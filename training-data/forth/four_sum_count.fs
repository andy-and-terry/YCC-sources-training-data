\ Count (a,b,c,d) tuples whose sum is zero
create as 1 , 2 ,
create bs -2 , -1 ,
create cs -1 , 2 ,
create ds 0 , 2 ,
variable tuples
variable ia  variable ib  variable ic  variable id

: @i ( addr i -- v ) cells + @ ;

: four-sum-count ( -- n )
  0 tuples !
  2 0 do i ia !
    2 0 do i ib !
      2 0 do i ic !
        2 0 do i id !
          as ia @ @i  bs ib @ @i +  cs ic @ @i +  ds id @ @i +
          0= if 1 tuples +! then
        loop
      loop
    loop
  loop
  tuples @ ;

four-sum-count . cr   \ 2
