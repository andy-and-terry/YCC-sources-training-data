: CULLEN ( n -- c )  DUP 1 SWAP LSHIFT * 1+ ;

: MAIN  6 1 DO  I . I CULLEN . CR  LOOP ;
MAIN
