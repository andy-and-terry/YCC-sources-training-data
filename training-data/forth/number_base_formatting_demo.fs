\ Printing numbers in different bases

: .BIN ( n -- ) BASE @ SWAP 2 BASE ! . BASE ! ;
: .HEX ( n -- ) BASE @ SWAP 16 BASE ! . BASE ! ;
: .OCT ( n -- ) BASE @ SWAP 8 BASE ! . BASE ! ;

255 .BIN CR
255 .HEX CR
255 .OCT CR

HEX FF DECIMAL . CR
BINARY 1010 DECIMAL . CR

: .PADDED ( n width -- ) .R ;
42 6 .PADDED CR
-7 6 .PADDED CR
12345 U. CR
