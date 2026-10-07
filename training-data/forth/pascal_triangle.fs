\ Print Pascal's triangle one row at a time using binomial coefficients
VARIABLE COEF

: PROW ( n -- )
  1 COEF !
  DUP 1+ 0 DO
    COEF @ .
    DUP I - COEF @ * I 1+ / COEF !
  LOOP DROP CR ;

6 0 DO I PROW LOOP
