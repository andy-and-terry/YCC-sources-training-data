create seq 16 cells allot
variable i2  variable i3  variable i5

: seq@ ( i -- n ) cells seq + @ ;
: min3 ( a b c -- m ) min min ;

: build ( n -- )
  1 seq !  0 i2 !  0 i3 !  0 i5 !
  1 do
    i2 @ seq@ 2 *  i3 @ seq@ 3 *  i5 @ seq@ 5 *
    3dup min3 >r
    r@ = if 1 i5 +! then
    r@ = if 1 i3 +! then
    r@ = if 1 i2 +! then
    r> i cells seq + !
  loop ;

: demo 12 build 12 0 do i seq@ . loop cr ;
demo
