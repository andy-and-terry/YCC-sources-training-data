\ Cantor pairing function and its inverse (integer sqrt by search).
: pair ( x y -- z )
  tuck + dup 1+ * 2/ + ;           \ (x+y)(x+y+1)/2 + y

: isqrt ( n -- r )
  0 begin 2dup 1+ dup * < 0= while 1+ repeat nip ;

: unpair ( z -- x y )
  dup 8 * 1+ isqrt 1- 2/           \ z w
  swap over dup 1+ * 2/ -          \ w y
  tuck - swap ;                    \ x y

3 4 pair . cr
32 unpair swap . . cr
bye
