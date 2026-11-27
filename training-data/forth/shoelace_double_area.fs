\ Twice the polygon area (integers) for a 4x3 rectangle.
CREATE XS 0 , 4 , 4 , 0 ,
CREATE YS 0 , 0 , 3 , 3 ,

: @I ( addr i -- n ) CELLS + @ ;
: CROSS ( i -- n )
  DUP 1+ 4 MOD { i j }
  XS i @I YS j @I *
  XS j @I YS i @I * - ;

: DOUBLE-AREA 0 4 0 DO I CROSS + LOOP ABS ;
DOUBLE-AREA . CR
