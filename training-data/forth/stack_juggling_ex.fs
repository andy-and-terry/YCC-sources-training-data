\ stack words
: demo
  1 2 3          \ 1 2 3
  rot            \ 2 3 1
  over           \ 2 3 1 3
  swap           \ 2 3 3 1
  .s cr
  drop drop drop drop ;
demo
