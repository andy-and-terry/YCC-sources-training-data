\ sum of squares 1..5 using DO ... LOOP
: sum-squares ( n -- sum )
  0 swap 1+ 1 do i dup * + loop ;
5 sum-squares .
