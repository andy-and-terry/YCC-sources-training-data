\ Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
: gcd ( a b -- g ) begin dup while tuck mod repeat drop ;

: phi ( n -- c )
  0 swap dup 1+ 1 ?do
    i over gcd 1 = if swap 1+ swap then
  loop drop ;

: chain-sum ( n -- sum )
  0 swap
  begin dup 1 > while phi dup rot + swap repeat
  drop ;

: show-ptn ( -- )
  200 2 do i dup chain-sum = if i . then loop cr ;

show-ptn
bye
