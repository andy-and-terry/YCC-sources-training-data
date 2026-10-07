\ Reverse the low 8 bits of a byte
: BIT-REVERSE8 ( b -- r )
  0 SWAP 8 0 DO
    DUP 1 AND ROT 1 LSHIFT OR SWAP 1 RSHIFT
  LOOP DROP ;

: .BYTE ( n -- )  BASE @ SWAP 2 BASE ! 0 <# # # # # # # # # #> TYPE BASE ! ;

1 BIT-REVERSE8 .BYTE CR
%00001101 BIT-REVERSE8 .BYTE CR
