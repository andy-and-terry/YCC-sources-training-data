\ Execution tokens: pass words around as data
: DOUBLE ( n -- n )  2 * ;
: NEGATE-IT ( n -- n )  NEGATE ;
: APPLY-TWICE ( n xt -- n )  DUP >R EXECUTE R> EXECUTE ;

5 ' DOUBLE APPLY-TWICE . CR
5 ' NEGATE-IT APPLY-TWICE . CR

CREATE OPS ' DOUBLE , ' NEGATE-IT ,
: RUN-OP ( n i -- n' )  CELLS OPS + @ EXECUTE ;
21 0 RUN-OP . CR
21 1 RUN-OP . CR
