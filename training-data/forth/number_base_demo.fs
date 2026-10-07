\ Switching number bases with BASE, HEX, DECIMAL

: .BIN ( n -- ) BASE @ SWAP 2 BASE ! . BASE ! ;
: .OCT ( n -- ) BASE @ SWAP 8 BASE ! . BASE ! ;
: .HEX ( n -- ) BASE @ SWAP HEX . BASE ! ;

255 .BIN CR
255 .OCT CR
255 .HEX CR

HEX FF 10 + DECIMAL . CR
2 BASE ! 1011 DECIMAL . CR
$FF . CR
%1010 . CR
#99 . CR
