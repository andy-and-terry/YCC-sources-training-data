\ Fermat primality test; Carmichael number 561 fools it
variable bb  variable ee  variable rr  variable mm

: powmod ( b e m -- r )
  mm ! ee ! mm @ mod bb ! 1 rr !
  begin ee @ 0> while
    ee @ 1 and if rr @ bb @ * mm @ mod rr ! then
    bb @ dup * mm @ mod bb !
    ee @ 2/ ee !
  repeat rr @ ;

: probably-prime? ( n -- flag )
  dup 2 > 0= if drop false exit then
  >r 2 r@ 1- r> powmod 1 = ;

: report ( n -- ) dup . probably-prime? if ." true" else ." false" then cr ;

97 report  91 report  561 report
