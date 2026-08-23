: GCD ( a b -- gcd )
  BEGIN
    DUP 0<>
  WHILE
    TUCK MOD
  REPEAT
  DROP ;

: LCM ( a b -- lcm )
  2DUP GCD >R
  * R> / ;

48 18 GCD .
4 6 LCM .
CR
