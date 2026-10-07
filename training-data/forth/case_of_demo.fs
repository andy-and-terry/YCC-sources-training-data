: DAY-NAME ( n -- )
  CASE
    1 OF ." Monday" ENDOF
    2 OF ." Tuesday" ENDOF
    3 OF ." Wednesday" ENDOF
    4 OF ." Thursday" ENDOF
    5 OF ." Friday" ENDOF
    6 OF ." Saturday" ENDOF
    7 OF ." Sunday" ENDOF
    ." Invalid"
  ENDCASE ;

: RUN-DEMO ( -- )
  3 DAY-NAME CR
  7 DAY-NAME CR
  9 DAY-NAME CR ;

RUN-DEMO
