: PROPER-SUM ( n -- sum )
  0 SWAP                         \ sum n
  DUP 2/ 1+ 1 ?DO
    DUP I MOD 0= IF SWAP I + SWAP THEN
  LOOP
  DROP ;

: ALIQUOT ( n -- )
  BEGIN DUP . DUP WHILE PROPER-SUM REPEAT
  DROP CR ;

12 ALIQUOT
