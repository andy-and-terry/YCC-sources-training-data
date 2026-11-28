\ Happy numbers: iterate sum of squared digits, bounded to 20 steps
: digit-sq-sum ( n -- s )
  0 swap
  begin dup 0> while
    10 /mod swap dup * rot + swap
  repeat drop ;

: happy? ( n -- flag )
  20 0 do
    dup 1 = if drop true unloop exit then
    digit-sq-sum
  loop
  drop false ;

: show-happy ( -- )
  0 1
  begin over 8 < while
    dup happy? if dup . swap 1+ swap then
    1+
  repeat 2drop cr ;

show-happy  \ 1 7 10 13 19 23 28 31
