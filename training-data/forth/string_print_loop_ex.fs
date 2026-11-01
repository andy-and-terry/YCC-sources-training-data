: stars ( n -- ) 0 ?do [char] * emit loop ;
: triangle ( n -- ) 1+ 1 ?do i stars cr loop ;
5 triangle
s" hello" type cr
