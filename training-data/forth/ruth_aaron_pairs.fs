\ Sum of prime factors counted with multiplicity.
variable m
variable p
variable total

: sopfr ( n -- s )
  m !  2 p !  0 total !
  begin
    p @ dup * m @ <=
  while
    begin m @ p @ mod 0= while
      p @ total +!
      m @ p @ / m !
    repeat
    1 p +!
  repeat
  m @ 1 > if m @ total +! then
  total @ ;

: main
  110 2 do
    i sopfr i 1+ sopfr = if i . then
  loop cr ;
main bye
