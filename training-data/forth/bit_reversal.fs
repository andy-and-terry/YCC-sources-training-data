\ Reverse the low 8 bits of a value
: reverse8 ( v -- r )
  0 swap
  8 0 do
    dup 1 and rot 2* or swap 2/
  loop drop ;

1   reverse8 .  \ 128
6   reverse8 .  \ 96
13  reverse8 .  \ 176
128 reverse8 .  \ 1
cr
