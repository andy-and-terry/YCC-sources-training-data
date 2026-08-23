: FIB-ITER ( n -- fib )
  0 1 ROT
  0 DO
    OVER + SWAP
  LOOP
  DROP ;

10 FIB-ITER .
CR
