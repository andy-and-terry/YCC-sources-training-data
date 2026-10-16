: CLAMP ( n lo hi -- n' ) ROT MIN MAX ;

15 0 10 CLAMP . CR
-5 0 10 CLAMP . CR
7 0 10 CLAMP . CR

CREATE V 5 , -3 , 12 , 99 , 0 ,

: CLAMP-V ( lo hi -- )
  5 0 DO
    2DUP V I CELLS + @ -ROT CLAMP V I CELLS + !
  LOOP 2DROP ;

: SHOW-V ( -- ) 5 0 DO V I CELLS + @ . LOOP CR ;

SHOW-V
0 10 CLAMP-V
SHOW-V
