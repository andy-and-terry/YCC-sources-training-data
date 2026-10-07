\ Pictured numeric output: <# # #S HOLD SIGN #>

: .HEX2 ( n -- ) BASE @ >R HEX 0 <# # # #> TYPE R> BASE ! ;

: .MONEY ( cents -- )
  DUP ABS 0 <# # # [CHAR] . HOLD #S ROT SIGN [CHAR] $ HOLD #> TYPE ;

: .TIME ( seconds -- )
  3600 /MOD SWAP 60 /MOD
  ROT 0 <# #S #> TYPE ." :"
  SWAP 0 <# # # #> TYPE ." :"
  0 <# # # #> TYPE ;

255 .HEX2 CR
12345 .MONEY CR
-250 .MONEY CR
3725 .TIME CR
