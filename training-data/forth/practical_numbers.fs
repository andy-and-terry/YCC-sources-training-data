\ Practical numbers: every m in 1..n is a sum of distinct divisors of n.
variable num
variable reach

: practical? ( n -- flag )
  num !  1 reach !                      \ bit i set <=> i is a subset sum
  num @ 1+ 1 do
    num @ i mod 0= if reach @ dup i lshift or reach ! then
  loop
  1 num @ 1+ lshift 1-                  \ mask
  dup reach @ and = ;

: main  41 1 do i practical? if i . then loop cr ;
main
bye
