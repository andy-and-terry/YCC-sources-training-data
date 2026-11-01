\ Reverse-and-add until a palindrome; count the steps.
variable acc

: rev ( n -- r )
  0 acc !
  begin dup while 10 /mod swap acc @ 10 * + acc ! repeat
  drop acc @ ;

: steps ( n -- count )
  50 0 do
    i 0> if dup rev over = if drop i unloop exit then then
    dup rev +
  loop
  drop -1 ;

: main  56 steps . 57 steps . 59 steps . 79 steps . 89 steps . cr ;
main bye
