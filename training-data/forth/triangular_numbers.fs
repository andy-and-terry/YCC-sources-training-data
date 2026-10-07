\ Triangular numbers by formula and by accumulation
: TRI ( n -- t )  DUP 1+ * 2/ ;

: TRI-LIST ( n -- )  0 SWAP 1+ 1 DO I + DUP . LOOP DROP CR ;

10 TRI . CR
8 TRI-LIST
