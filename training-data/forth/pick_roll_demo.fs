: SHOW-STACK ( -- ) .S CR ;

: DEMO ( -- )
  10 20 30 40
  SHOW-STACK
  2 PICK . CR        \ copy third item (20)
  3 ROLL SHOW-STACK  \ move deepest item to top
  -ROT SHOW-STACK
  ROT SHOW-STACK
  2SWAP SHOW-STACK
  2DUP SHOW-STACK
  2DROP 2DROP 2DROP
  ." depth: " DEPTH . CR ;

DEMO
