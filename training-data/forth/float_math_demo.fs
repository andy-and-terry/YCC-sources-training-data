\ Floating point stack in gforth
: HYPOT ( F: a b -- c )  FDUP F* FSWAP FDUP F* F+ FSQRT ;

: CIRCLE-AREA ( F: r -- area )  FDUP F* 3.141592653589793E0 F* ;

3.0E0 4.0E0 HYPOT F. CR
2.0E0 CIRCLE-AREA F. CR
2.0E0 FSQRT F. CR
7 S>F 2 S>F F/ F. CR
