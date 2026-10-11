: INC ( n -- n+1 ) 1+ ;
: INC2 ( n -- n+2 ) INC INC ;
: INC4 ( n -- n+4 ) INC2 INC2 ;
: INC8 ( n -- n+8 ) INC4 INC4 ;

0 INC8 . CR
10 INC4 . CR

: ANSWER ( -- 42 ) 0 INC8 INC8 INC8 INC8 INC8 2 + ;
ANSWER . CR
