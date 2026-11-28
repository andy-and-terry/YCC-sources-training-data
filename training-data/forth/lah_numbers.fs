: FACT ( n -- n! ) 1 SWAP 1+ 1 ?DO I * LOOP ;
: COMB ( n k -- c ) 2DUP - FACT >R FACT SWAP FACT SWAP R> * / ;
: LAH ( n k -- l ) 2DUP 1- SWAP 1- SWAP COMB >R OVER FACT R> * SWAP FACT / ;

: ROW ( n -- ) DUP 1+ 1 ?DO DUP I LAH . LOOP DROP CR ;
: LAH-TABLE 6 1 DO I ROW LOOP ;
LAH-TABLE
