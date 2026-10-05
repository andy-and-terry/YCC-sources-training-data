\ Each row is built from C(n,k+1) = C(n,k) * (n-k) / (k+1)
: ROW ( n -- )
  1                       \ n c
  OVER 1+ 0 DO
    DUP .                 \ print current coefficient
    OVER I - * I 1+ /     \ next coefficient
  LOOP
  2DROP ;

: TRIANGLE ( rows -- )
  0 DO I ROW CR LOOP ;

6 TRIANGLE
