: SUM-TO-N ( n -- sum )
  DUP 0= IF EXIT THEN
  DUP 1- RECURSE + ;

100 SUM-TO-N .
10 SUM-TO-N .
CR
