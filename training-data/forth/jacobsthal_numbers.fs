\ Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
: jacobsthal ( n -- )
  0 1 rot 0 do               \ stack: a b
    over .                   \ print a
    swap 2* over +           \ ( a b -- b b+2a )
  loop
  2drop cr ;

15 jacobsthal
