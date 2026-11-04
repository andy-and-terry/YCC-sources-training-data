\ Common stack words, shown with their effects.
: demo
  1 2 3  .s cr         \ <3> 1 2 3
  rot    .s cr         \ <3> 2 3 1
  -rot   .s cr         \ <3> 1 2 3
  over   .s cr         \ <4> 1 2 3 2
  2drop  .s cr         \ <2> 1 2
  swap   .s cr         \ <2> 2 1
  drop drop ;
demo
