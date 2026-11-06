\ Count contiguous subarrays whose sum equals k (running sums)
create nums 1 , 1 , 1 ,
3 constant len
variable k  variable cnt  variable sum

: count-subarrays ( k -- n )
  k ! 0 cnt !
  len 0 do
    0 sum !
    len i do
      nums i cells + @ sum +!
      sum @ k @ = if 1 cnt +! then
    loop
  loop
  cnt @ ;

2 count-subarrays . cr
