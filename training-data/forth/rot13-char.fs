: rot13 ( c -- c' )
  dup [char] a [char] z 1+ within if
    [char] a - 13 + 26 mod [char] a +
  else dup [char] A [char] Z 1+ within if
    [char] A - 13 + 26 mod [char] A +
  then then ;

: rot13-type ( addr n -- ) 0 ?do dup i + c@ rot13 emit loop drop ;

s" Hello" rot13-type cr
