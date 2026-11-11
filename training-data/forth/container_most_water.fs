\ Container with most water: two-pointer sweep
create heights 1 , 8 , 6 , 2 , 5 , 4 , 8 , 3 , 7 ,
9 constant n
variable lo
variable hi
variable best

: h@ ( i -- v ) cells heights + @ ;

: max-area ( -- area )
  0 lo !  n 1- hi !  0 best !
  begin lo @ hi @ < while
    lo @ h@  hi @ h@  min  hi @ lo @ -  *   \ area
    best @ max best !
    lo @ h@ hi @ h@ < if 1 lo +! else -1 hi +! then
  repeat
  best @ ;

max-area . cr   \ 49
