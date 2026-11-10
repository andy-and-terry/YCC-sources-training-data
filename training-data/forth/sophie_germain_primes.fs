variable pflag
variable cnt
variable target

: prime? ( n -- flag )
  dup 2 < if drop false exit then
  true pflag !
  dup 2 ?do
    i i * over > if leave then
    dup i mod 0= if false pflag ! leave then
  loop
  drop pflag @ ;

: sophie? ( p -- flag ) dup prime? swap 2* 1+ prime? and ;

: sophie-germain ( count -- )
  target ! 0 cnt ! 2
  begin cnt @ target @ < while
    dup sophie? if dup . 1 cnt +! then
    1+
  repeat drop cr ;

10 sophie-germain   \ 2 3 5 11 23 29 41 53 83 89
