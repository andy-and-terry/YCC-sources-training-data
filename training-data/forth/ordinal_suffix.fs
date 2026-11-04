: suffix ( n -- c-addr u )
  dup 100 mod dup 11 >= swap 13 <= and if drop s" th" exit then
  10 mod
  case
    1 of s" st" endof
    2 of s" nd" endof
    3 of s" rd" endof
    s" th" rot
  endcase ;

: .ordinal ( n -- ) dup . suffix type space ;

: demo 1 .ordinal 2 .ordinal 3 .ordinal 4 .ordinal 11 .ordinal 12 .ordinal 21 .ordinal 111 .ordinal cr ;
demo
