CREATE G 21 CELLS ALLOT

: G@ ( i -- v )  CELLS G + @ ;
: G! ( v i -- )  CELLS G + ! ;

: GOLOMB-FILL ( -- )
  1 1 G!
  21 2 DO
    I  I 1- G@ G@ -  G@ 1+  I G!
  LOOP ;

: .GOLOMB ( -- )
  21 1 DO I G@ . LOOP CR ;

GOLOMB-FILL .GOLOMB
