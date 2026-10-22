CREATE Q 21 CELLS ALLOT

: Q@ ( i -- v )  CELLS Q + @ ;
: Q! ( v i -- )  CELLS Q + ! ;

: Q-FILL ( -- )
  1 1 Q!  1 2 Q!
  21 3 DO
    I I 1- Q@ - Q@
    I I 2 - Q@ - Q@
    +  I Q!
  LOOP ;

: .Q ( -- )
  21 1 DO I Q@ . LOOP CR ;

Q-FILL .Q
