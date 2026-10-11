: STARS ( n -- ) 0 ?DO [CHAR] * EMIT LOOP ;

: TRIANGLE ( rows -- )
  1+ 1 DO I STARS CR LOOP ;

: PYRAMID ( rows -- )
  DUP 1+ 1 DO
    DUP I - SPACES
    I 2* 1- STARS CR
  LOOP DROP ;

5 TRIANGLE
CR
5 PYRAMID
