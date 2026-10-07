\ Binary-reflected Gray code
: >GRAY ( n -- g )  DUP 1 RSHIFT XOR ;

: GRAY> ( g -- n )
  0 SWAP                       \ n g
  BEGIN DUP WHILE TUCK XOR SWAP 1 RSHIFT REPEAT
  DROP ;

: .BIN ( n -- )  BASE @ SWAP 2 BASE ! 0 <# # # # #> TYPE BASE ! ;

8 0 DO I >GRAY .BIN SPACE LOOP CR
5 >GRAY GRAY> . CR
