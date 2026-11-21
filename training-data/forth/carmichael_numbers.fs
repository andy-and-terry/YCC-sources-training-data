\ Carmichael numbers via Korselt's criterion: n is squarefree, composite,
\ and p - 1 divides n - 1 for every prime factor p.
variable nn
variable m
variable p
variable cnt
variable ok

: factor ( q -- )
  1- nn @ 1- swap mod 0<> if 0 ok ! then
  1 cnt +! ;

: carmichael? ( n -- flag )
  dup nn ! m ! 2 p ! 0 cnt ! -1 ok !
  begin p @ dup * m @ <= ok @ and while
    m @ p @ mod 0= if
      m @ p @ / m !
      m @ p @ mod 0= if 0 ok ! then
      p @ factor
    else
      1 p +!
    then
  repeat
  m @ 1 > if m @ factor then
  ok @ cnt @ 2 >= and ;

: show-carmichael ( -- )
  3000 3 do i carmichael? if i . then 2 +loop cr ;

show-carmichael
bye
