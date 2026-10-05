: PACK ( r g b -- rgb )
  SWAP 8 LSHIFT OR
  SWAP 16 LSHIFT OR ;

: UNPACK ( rgb -- r g b )
  DUP 16 RSHIFT 255 AND
  SWAP DUP 8 RSHIFT 255 AND
  SWAP 255 AND ;

: .HEX6 ( u -- )
  BASE @ >R HEX 0 <# # # # # # # #> TYPE R> BASE ! ;

18 52 86 PACK DUP .HEX6 CR
UNPACK . . . CR
