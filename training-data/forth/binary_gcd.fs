: BINARY-GCD ( a b -- gcd )
  BEGIN
    OVER 0<>
  WHILE
    DUP 0= IF
      DROP 0
    ELSE
      2DUP OR 1 AND 0= IF
        2 / SWAP 2 / SWAP RECURSE 2 *
      ELSE
        DUP 1 AND 0= IF
          2 / RECURSE
        ELSE
          OVER 1 AND 0= IF
            SWAP 2 / SWAP RECURSE
          ELSE
            2DUP > IF SWAP THEN
            TUCK - SWAP RECURSE
          THEN
        THEN
      THEN
    THEN
  REPEAT
  DROP ;

48 18 BINARY-GCD . CR
