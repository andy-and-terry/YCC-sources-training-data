: swap-char ( c -- c' )
  dup [char] A [char] Z 1+ within if 32 + exit then
  dup [char] a [char] z 1+ within if 32 - then ;

: swap-case ( addr u -- )
  0 ?do dup i + c@ swap-char emit loop drop ;

s" Hello World 42" swap-case cr
