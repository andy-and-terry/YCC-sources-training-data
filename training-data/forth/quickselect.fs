CREATE ARR 9 , 3 , 7 , 1 , 8 , 2 , 5 ,
7 CONSTANT ARR-LEN

: ELEM ( i -- addr ) CELLS ARR + ;

: SWAP-ELEMS ( i j -- )
  ELEM SWAP ELEM
  DUP @ >R
  OVER @ SWAP !
  R> SWAP ! ;

VARIABLE P-LO
VARIABLE P-HI
VARIABLE PIVOT
VARIABLE STORE
VARIABLE IDX

: PARTITION ( lo hi -- p )
  P-HI !  P-LO !
  P-HI @ ELEM @ PIVOT !
  P-LO @ STORE !
  P-LO @ IDX !
  BEGIN
    IDX @ P-HI @ <
  WHILE
    IDX @ ELEM @ PIVOT @ <
    IF
      STORE @ IDX @ SWAP-ELEMS
      1 STORE +!
    THEN
    1 IDX +!
  REPEAT
  STORE @ P-HI @ SWAP-ELEMS
  STORE @ ;

VARIABLE Q-LO
VARIABLE Q-HI
VARIABLE Q-K
VARIABLE Q-DONE
VARIABLE Q-RESULT

: QUICKSELECT ( lo hi k -- value )
  Q-K !  Q-HI !  Q-LO !
  0 Q-DONE !
  BEGIN
    Q-DONE @ 0=
  WHILE
    Q-LO @ Q-HI @ =
    IF
      Q-LO @ ELEM @ Q-RESULT !
      1 Q-DONE !
    ELSE
      Q-LO @ Q-HI @ PARTITION
      DUP Q-K @ =
      IF
        ELEM @ Q-RESULT !
        1 Q-DONE !
      ELSE
        DUP Q-K @ >
        IF
          1- Q-HI !
        ELSE
          1+ Q-LO !
        THEN
      THEN
    THEN
  REPEAT
  Q-RESULT @ ;

0 ARR-LEN 1- 2 QUICKSELECT .
CR
