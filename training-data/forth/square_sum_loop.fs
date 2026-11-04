: sum-of-squares ( n -- sum ) 0 swap 1+ 1 do i dup * + loop ;
: square-of-sum  ( n -- sq )  0 swap 1+ 1 do i + loop dup * ;

: diff ( n -- d ) dup square-of-sum swap sum-of-squares - ;

10 diff . cr   \ 2640
