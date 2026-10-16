: SQUARE ( n -- n^2 ) DUP * ;
: CUBE   ( n -- n^3 ) DUP SQUARE * ;

: TABLE ( n -- )
  1+ 1 DO I . I SQUARE . I CUBE . CR LOOP ;

8 TABLE
