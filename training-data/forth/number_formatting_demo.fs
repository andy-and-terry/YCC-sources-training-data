: .MONEY ( cents -- )
  DUP >R ABS S>D
  <# # # [CHAR] . HOLD #S R> SIGN #>
  TYPE ;

: .2D ( n -- ) S>D <# # # #> TYPE ;

: .TIME ( h m s -- )
  ROT .2D ." :" SWAP .2D ." :" .2D ;

: .HEX ( u -- )
  BASE @ >R HEX U. R> BASE ! ;

12345 .MONEY CR
-5 .MONEY CR
7 5 9 .TIME CR
255 .HEX CR
