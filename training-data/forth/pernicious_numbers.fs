\ Pernicious numbers: the popcount is prime.
variable cnt
variable result

: prime? ( n -- flag )
  dup 2 < if drop false exit then
  true result !
  dup 2 ?do
    i i * over > if leave then
    dup i mod 0= if false result ! leave then
  loop
  drop result @ ;

: popcount ( n -- c )
  0 cnt !
  begin dup while dup 1 and cnt +! 1 rshift repeat
  drop cnt @ ;

: main  21 1 do i popcount prime? if i . then loop cr ;
main bye
