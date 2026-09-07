: DIVIDE ( a b -- a/b )
  DUP 0= IF -1 THROW THEN
  / ;

: SAFE-DIVIDE ( a b -- )
  ['] DIVIDE CATCH
  IF
    2DROP ." error" CR
  ELSE
    . CR
  THEN ;

10 2 SAFE-DIVIDE
10 0 SAFE-DIVIDE
