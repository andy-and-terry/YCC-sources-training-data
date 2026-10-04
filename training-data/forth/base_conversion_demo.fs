: .BIN ( n -- ) BASE @ SWAP 2 BASE ! . BASE ! ;
: .HEX ( n -- ) BASE @ SWAP HEX . BASE ! ;
: .OCT ( n -- ) BASE @ SWAP 8 BASE ! . BASE ! ;

255 .BIN CR
255 .HEX CR
255 .OCT CR

HEX FF 10 + DECIMAL . CR
HEX 1F DECIMAL . CR

: PARSE-HEX ( addr len -- n )
  BASE @ >R HEX
  0 0 2SWAP >NUMBER 2DROP DROP
  R> BASE ! ;

S" 7FFF" PARSE-HEX . CR
S" ff" PARSE-HEX . CR

\ Print a digit in any base from 2 to 36.
: .IN-BASE ( n base -- )
  BASE @ >R BASE ! . R> BASE ! ;

100 7 .IN-BASE CR
