: POW-MOD ( base exp mod -- result )
  >R 1 -ROT
  BEGIN
    DUP 0>
  WHILE
    DUP 1 AND IF
      ROT 2 PICK * R@ MOD -ROT
    THEN
    SWAP DUP * R@ MOD SWAP
    2/
  REPEAT
  2DROP R> DROP ;

2 10 1000 POW-MOD .
3 200 13 POW-MOD .
7 0 5 POW-MOD .
CR
