: GCD ( a b -- gcd )
  BEGIN
    DUP 0<>
  WHILE
    TUCK MOD
  REPEAT
  DROP ;

48 18 GCD . CR
