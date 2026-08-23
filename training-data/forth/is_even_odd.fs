: EVEN? ( n -- flag ) 2 MOD 0= ;
: ODD? ( n -- flag ) EVEN? 0= ;

4 EVEN? .
7 ODD? .
CR
