\ Secant method for x^2 - 2 using the floating-point stack.
: F ( f: x -- y ) FDUP F* 2e F- ;

: SECANT ( f: x0 x1 -- root )
  50 0 DO
    FOVER F FOVER F  ( x0 x1 f0 f1 )
    FSWAP FOVER F- ( x0 x1 f1 f1-f0 )
    FOVER F0= IF FDROP FDROP LEAVE THEN
    F/ ( x0 x1 f1/(f1-f0) )
    FOVER FROT F- ( x1 q x1-x0 )
    F* FOVER FSWAP F- ( x1 x2 )
  LOOP
  FSWAP FDROP ;

1e 2e SECANT F. CR
