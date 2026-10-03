6 CONSTANT NUM-EDGES
6 CONSTANT NUM-NODES
CREATE FROM-ARR 0 , 0 , 1 , 1 , 2 , 3 ,
CREATE TO-ARR   1 , 2 , 2 , 3 , 3 , 4 ,
CREATE WT-ARR   4 , 3 , 1 , 2 , 5 , 6 ,
CREATE ORDER-ARR NUM-EDGES CELLS ALLOT
CREATE PARENT-ARR NUM-NODES CELLS ALLOT
VARIABLE TOTAL

: FROM@ ( i -- addr ) CELLS FROM-ARR + ;
: TO@ ( i -- addr ) CELLS TO-ARR + ;
: WT@ ( i -- addr ) CELLS WT-ARR + ;
: ORDER@ ( i -- addr ) CELLS ORDER-ARR + ;
: PARENT@ ( n -- addr ) CELLS PARENT-ARR + ;

: FIND ( n -- root )
  BEGIN DUP PARENT@ @ OVER <> WHILE PARENT@ @ REPEAT ;

: SORT-EDGES ( -- )
  NUM-EDGES 0 DO I I ORDER@ ! LOOP
  NUM-EDGES 1 DO
    NUM-EDGES I DO
      I ORDER@ @ WT@ @
      I 1- ORDER@ @ WT@ @
      < IF
        I ORDER@ @ I 1- ORDER@ @
        I ORDER@ ! I 1- ORDER@ !
      THEN
    LOOP
  LOOP ;

: KRUSKAL-MST ( -- weight )
  NUM-NODES 0 DO I I PARENT@ ! LOOP
  SORT-EDGES
  0 TOTAL !
  NUM-EDGES 0 DO
    I ORDER@ @ FROM@ @ FIND
    I ORDER@ @ TO@ @ FIND
    2DUP <> IF
      PARENT@ !
      I ORDER@ @ WT@ @ TOTAL +!
    ELSE
      2DROP
    THEN
  LOOP
  TOTAL @ ;

KRUSKAL-MST . CR
