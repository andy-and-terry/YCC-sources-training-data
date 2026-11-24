\ Moebius function: 0 if n has a squared prime factor, else (-1)^k.
variable m   variable p   variable res

: mobius ( n -- mu )
  m !  2 p !  1 res !
  begin p @ dup * m @ <= while
    m @ p @ mod 0= if
      m @ p @ / m !
      m @ p @ mod 0= if 0 exit then
      res @ negate res !
    then
    1 p +!
  repeat
  m @ 1 > if res @ negate else res @ then ;

: main  31 1 do i mobius . loop cr ;
main
bye
