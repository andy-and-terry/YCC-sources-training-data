VARIABLE N
VARIABLE X
VARIABLE X1

: ISQRT ( n -- root )
  DUP 0= IF EXIT THEN
  N !
  N @ X !
  BEGIN
    N @ X @ / X @ + 2 / X1 !
    X1 @ X @ <
  WHILE
    X1 @ X !
  REPEAT
  X @ ;

50 ISQRT . CR
0 ISQRT . CR
1 ISQRT . CR
