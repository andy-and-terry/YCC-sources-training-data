\ Deep stack access with PICK and ROLL

: SHOW ( -- ) ." Stack: " .S CR ;

: DEMO
  10 20 30 40 50
  SHOW
  0 PICK . CR      \ top copy (same as DUP)
  3 PICK . CR      \ fourth item, 20
  4 ROLL           \ move the deepest to top
  SHOW
  2 ROLL           \ rotate third item to top
  SHOW
  5 0 DO DROP LOOP ;

DEMO
