create values 3 , 1 , 4 , 1 , 5 , 9 , 2 , 6 ,
create prefix 9 cells allot

: build-prefix
  0 prefix !
  8 0 do
    prefix i cells + @  values i cells + @ +
    prefix i 1+ cells + !
  loop ;

: query ( lo hi -- sum )
  cells prefix + @  swap cells prefix + @ - ;

build-prefix
2 5 query . cr
