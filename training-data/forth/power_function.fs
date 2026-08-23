: POWER ( base exp -- result )
  1 SWAP
  0 DO OVER * LOOP
  SWAP DROP ;

2 10 POWER .
3 5 POWER .
CR
