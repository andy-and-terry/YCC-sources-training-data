\ Print Pascal's triangle using binomial coefficients: C(n,k) = C(n,k-1)*(n-k+1)/k

: ROW ( n -- )
  1 ( n c )
  OVER 1+ 0 DO
    DUP .
    OVER I - * I 1+ /
  LOOP
  2DROP CR ;

: PASCAL ( rows -- ) 0 DO I ROW LOOP ;

6 PASCAL
