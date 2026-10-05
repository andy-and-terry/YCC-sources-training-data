: >GRAY ( n -- g ) DUP 1 RSHIFT XOR ;

: GRAY> ( g -- n )
  0
  BEGIN OVER WHILE
    OVER XOR
    SWAP 1 RSHIFT SWAP
  REPEAT
  NIP ;

: .BIN3 ( n -- )
  BASE @ >R 2 BASE !
  0 <# # # # #> TYPE
  R> BASE ! ;

: DEMO ( -- )
  8 0 DO
    I >GRAY DUP .BIN3 SPACE GRAY> . CR
  LOOP ;

DEMO
