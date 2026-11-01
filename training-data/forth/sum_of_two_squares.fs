\ Positive n expressible as a*a + b*b with a, b >= 0.
variable target
variable found

: representable? ( n -- flag )
  target !  false found !
  7 0 do
    7 i do
      i i * j j * + target @ = if true found ! then
    loop
  loop
  found @ ;

: main  31 1 do i representable? if i . then loop cr ;
main bye
