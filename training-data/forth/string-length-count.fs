: count-char ( addr n c -- k )
  0 >r
  swap 0 ?do
    over i + c@ 2 pick = if r> 1+ >r then
  loop 2drop r> ;

s" mississippi" [char] s count-char . cr
