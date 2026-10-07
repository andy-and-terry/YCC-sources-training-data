\ Pictured numeric output: format a number with a decimal point
: .MONEY ( cents -- )
  DUP ABS 0 <# # # [CHAR] . HOLD #S ROT SIGN #> TYPE ;

: .HEX ( n -- )  BASE @ SWAP 16 BASE ! 0 <# #S #> TYPE BASE ! ;

12345 .MONEY CR
-250 .MONEY CR
255 .HEX CR
