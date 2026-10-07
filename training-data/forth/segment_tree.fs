8 CONSTANT ST-N
CREATE SRC 2 , 4 , 6 , 8 , 10 , 12 , 14 , 16 ,
CREATE SEGA 2 ST-N * CELLS ALLOT
VARIABLE ST-L
VARIABLE ST-R
VARIABLE ST-SUM
VARIABLE ST-NODE

: SEG@ ( i -- addr ) CELLS SEGA + ;

: ST-BUILD ( -- )
  ST-N 0 DO
    I CELLS SRC + @ ST-N I + SEG@ !
  LOOP
  ST-N 1 DO
    ST-N I - ST-NODE !
    ST-NODE @ 2 * SEG@ @ ST-NODE @ 2 * 1+ SEG@ @ + ST-NODE @ SEG@ !
  LOOP ;

: ST-QUERY ( l r -- sum )
  ST-N + ST-R !
  ST-N + ST-L !
  0 ST-SUM !
  BEGIN
    ST-L @ ST-R @ <
  WHILE
    ST-L @ 2 MOD 1 = IF
      ST-SUM @ ST-L @ SEG@ @ + ST-SUM !
      1 ST-L +!
    THEN
    ST-R @ 2 MOD 1 = IF
      -1 ST-R +!
      ST-SUM @ ST-R @ SEG@ @ + ST-SUM !
    THEN
    ST-L @ 2 / ST-L !
    ST-R @ 2 / ST-R !
  REPEAT
  ST-SUM @ ;

ST-BUILD
2 6 ST-QUERY .
0 8 ST-QUERY .
5 8 ST-QUERY .
CR
