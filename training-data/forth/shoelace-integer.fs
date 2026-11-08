create px 0 , 4 , 4 , 0 ,
create py 0 , 0 , 3 , 3 ,

: cross ( i j -- n ) 2dup
  cells py + @ swap cells px + @ * >r
  cells py + @ swap cells px + @ * r> - ;

: area2 ( -- n )
  0 4 0 do
    i dup 1+ 4 mod ( i j )
    swap cells px + @  over cells py + @ *
    swap cells px + @  i cells py + @ * -
    +
  loop abs ;

area2 2/ . cr
