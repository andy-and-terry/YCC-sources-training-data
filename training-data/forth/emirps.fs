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

: reverse-digits ( n -- r )
  0 swap
  begin dup 0> while
    10 /mod >r swap 10 * + r>
  repeat drop ;

: emirp? ( n -- flag )
  dup reverse-digits 2dup = if 2drop drop false exit then
  prime? swap prime? and ;

: emirps ( count -- )
  target ! 0 cnt ! 2
  begin cnt @ target @ < while
    dup emirp? if dup . 1 cnt +! then
    1+
  repeat drop cr ;

10 emirps   \ 13 17 31 37 71 73 79 97 107 113
