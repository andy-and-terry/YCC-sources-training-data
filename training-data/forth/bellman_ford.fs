5 CONSTANT NODES
6 CONSTANT EDGES
999999 CONSTANT INF
CREATE FROM-ARR 0 , 0 , 1 , 1 , 2 , 3 ,
CREATE TO-ARR   1 , 2 , 2 , 3 , 3 , 4 ,
CREATE WT-ARR   4 , 1 , 2 , 1 , 5 , 3 ,
CREATE DIST NODES CELLS ALLOT

: FROM@ ( i -- addr ) CELLS FROM-ARR + ;
: TO@ ( i -- addr ) CELLS TO-ARR + ;
: WT@ ( i -- addr ) CELLS WT-ARR + ;
: DIST@ ( n -- addr ) CELLS DIST + ;

: INIT ( -- )
  NODES 0 DO INF I DIST@ ! LOOP
  0 0 DIST@ ! ;

: RELAX-ALL ( -- )
  EDGES 0 DO
    I FROM@ @ DIST@ @ INF <> IF
      I FROM@ @ DIST@ @ I WT@ @ +
      I TO@ @ DIST@ @ MIN
      I TO@ @ DIST@ !
    THEN
  LOOP ;

: BELLMAN-FORD ( -- )
  INIT
  NODES 1- 0 DO RELAX-ALL LOOP ;

BELLMAN-FORD
NODES 0 DO I DIST@ @ . LOOP
CR
