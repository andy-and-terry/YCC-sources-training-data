create a 10 , 9 , 2 , 5 , 3 , 7 , 101 , 18 ,
create tails 8 cells allot
variable len
: find-pos ( x -- pos )
  len @ 0 ?do dup tails i cells + @ <= if drop i unloop exit then loop drop len @ ;
: lis
  0 len !
  8 0 do
    a i cells + @ find-pos ( pos )
    a i cells + @ over cells tails + !
    dup len @ = if 1 len +! then drop
  loop
  len @ . cr ;
lis
