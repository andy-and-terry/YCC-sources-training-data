: FIBONACCI ( n -- fib(n) )
  0 1 ROT 0 DO
    OVER + SWAP
  LOOP
  DROP ;

10 FIBONACCI . CR
