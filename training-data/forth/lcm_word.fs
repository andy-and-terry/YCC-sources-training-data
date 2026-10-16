: GCD ( a b -- g ) BEGIN DUP WHILE TUCK MOD REPEAT DROP ;
: LCM ( a b -- l ) 2DUP GCD >R * R> / ;

4 6 LCM . CR
21 6 LCM . CR
7 13 LCM . CR

\ lcm of 1..10
: LCM-RANGE ( n -- l ) 1 SWAP 1+ 1 DO I LCM LOOP ;
10 LCM-RANGE . CR
