\ Formatting numbers with pictured numeric output (<# # #S HOLD #>).
: .MONEY ( cents -- )
  0 <# # # [CHAR] . HOLD #S [CHAR] $ HOLD #> TYPE ;

: .HH:MM ( minutes -- )
  60 /MOD SWAP
  0 <# # # 2DROP [CHAR] : HOLD
  0 # # #> TYPE ;

: .PADDED ( n width -- )
  >R 0 <# #S #>
  R> OVER - 0 MAX SPACES TYPE ;

123456 .MONEY CR
5 .MONEY CR
75 .HH:MM CR
605 .HH:MM CR
42 6 .PADDED CR
7 3 .PADDED CR
