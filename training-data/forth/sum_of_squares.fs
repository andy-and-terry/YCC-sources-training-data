: SUM-OF-SQUARES ( n -- sum )
  0 SWAP
  1+ 1 DO
    I DUP * ROT + SWAP
  LOOP
  DROP ;

10 SUM-OF-SQUARES .
CR
