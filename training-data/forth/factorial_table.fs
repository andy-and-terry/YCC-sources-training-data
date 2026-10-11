\ Precompute factorials into a table at load time
13 CONSTANT SIZE
CREATE FACTS SIZE CELLS ALLOT

: BUILD ( -- )
  1 FACTS !
  SIZE 1 DO FACTS I 1- CELLS + @ I * FACTS I CELLS + ! LOOP ;

: FACT ( n -- n! ) CELLS FACTS + @ ;

BUILD
0 FACT . CR
5 FACT . CR
10 FACT . CR
12 FACT . CR
