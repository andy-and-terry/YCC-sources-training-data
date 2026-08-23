: COUNT-WORDS ( addr len -- count )
  0 -ROT
  OVER + SWAP
  FALSE -ROT
  BEGIN
    2DUP <
  WHILE
    DUP C@ BL =
    IF
      DROP SWAP
    ELSE
      SWAP 0= IF ROT 1+ ROT SWAP THEN TRUE SWAP
    THEN
    ROT ROT
    1+ SWAP
  REPEAT
  2DROP DROP ;

S" the quick brown fox" COUNT-WORDS .
CR
