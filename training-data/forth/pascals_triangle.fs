8 CONSTANT ROWS
CREATE ROW-ARR ROWS CELLS ALLOT

: ROW@ ( i -- addr ) CELLS ROW-ARR + ;

: PRINT-ROW ( n -- )
  DUP 0 DO I ROW@ @ . LOOP
  DROP CR ;

: PASCALS-TRIANGLE ( -- )
  ROWS 0 DO
    I ROW@ 1 SWAP !
    I 0> IF
      I 1+ 2/ 1+ 1 DO
        I 1+ I - ROW@ @
        I ROW@ @
        +
        I ROW@ !
      LOOP
    THEN
    I 1+ PRINT-ROW
  LOOP ;

PASCALS-TRIANGLE
