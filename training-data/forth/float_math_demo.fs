: HYPOTENUSE ( f: a b -- c )
  FDUP F* FSWAP FDUP F* F+ FSQRT ;

: CIRCLE-AREA ( f: r -- area )
  FDUP F* 3.14159265e F* ;

: C>F ( f: c -- f ) 9e F* 5e F/ 32e F+ ;

3e 4e HYPOTENUSE F. CR
2e CIRCLE-AREA F. CR
100e C>F F. CR
2e FSQRT F. CR
1e FEXP F. CR
10e FLN F. CR
2.5e FLOOR F>S . CR
-2.5e FABS F. CR
3e 7e FMAX F. CR
5 S>F 2 S>F F/ F. CR
