: gcd ( a b -- g ) begin dup while tuck mod repeat drop ;
: f ( v n -- v' ) >r dup * 1+ r> mod ;
: rho ( n -- d )
  { n } 2 2 1
  begin dup 1 = while
    drop
    swap n f swap n f n f
    2dup - abs n gcd
  repeat
  nip nip ;
8051 rho . cr
