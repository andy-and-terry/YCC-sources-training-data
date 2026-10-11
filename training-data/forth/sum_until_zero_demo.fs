\ Sum numbers placed on the stack until a zero sentinel is reached
: SUM-UNTIL-ZERO ( 0 n1 n2 ... -- sum )
  0 >R
  BEGIN DUP WHILE R> + >R REPEAT
  DROP R> ;

0 5 10 15 SUM-UNTIL-ZERO . CR
0 1 2 3 4 5 SUM-UNTIL-ZERO . CR
0 SUM-UNTIL-ZERO . CR
